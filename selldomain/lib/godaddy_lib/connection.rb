require 'cgi'
require 'net/https'
require 'date'
require 'time'
require 'uri'
require 'nokogiri'
require 'active_support/all'
#require 'active_resource/formats'

module GoDaddyReseller
  # This is a copy/trimmed version of ActiveResource::Connection, with added support for cookies
  class ConnectionError < StandardError
    attr_reader :response

    def initialize(response, message = nil)
      @response = response
      @message  = message
    end

    def to_s
      "Failed with #{response.code} #{response.message if response.respond_to?(:message)}"
    end
  end

  # This is a copy/trimmed version of ActiveResource::Connection
  class Connection
    HTTP_FORMAT_HEADER_NAMES = {
      :get => 'Accept',
      :put => 'Content-Type',
      :post => 'Content-Type',
      :delete => 'Accept'
    }

    XML_MIME_TYPE = 'text/xml; charset=utf-8'


    # All GoDaddy requests require the request to be wrapped in this XML
    def self.wrap_with_header_xml(xml)
      "<?xml version=\"1.0\" encoding=\"utf-8\"?>" +
      "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"" +
      " xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\""+
      " xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body>" +
       xml +
      "</soap:Body></soap:Envelope>"
    end

    def self.uuid_hash
      { :sCLTRID => GoDaddyReseller::API.next_uid[0..50] }
    end

    def self.credentials_hash(account_id, pw)
      { :credential => { :Account => account_id, :Password => pw } }
    end

    #  Decodes a soap response, to actually get the response message.  Ugly but necessary.
    def self.decode_soap(soap_xml)
      decode(soap_xml)
      #decode(soap_response_text(soap_xml))
    end

    # For queries that have a textual response within the xml, not an xml response
    def self.soap_response_text(soap_xml)
      #decode(soap_xml)['body'].values[0].values[0]
      doc = Nokogiri::XML(soap_xml)
      a1 = Hash.from_xml(doc.to_xml)

      if !a1.nil?
        if a1["Envelope"]["Body"]["DescribeResponse"].nil?
          if a1["Envelope"]["Body"]["ProcessRequestResponse"].nil?
            small_xml = a1["Envelope"]["Body"]["CheckAvailabilityResponse"]["CheckAvailabilityResult"]
          else
            small_xml = a1["Envelope"]["Body"]["ProcessRequestResponse"]["ProcessRequestResult"]
          end
        else
          small_xml = a1["Envelope"]["Body"]["DescribeResponse"]["DescribeResult"]
        end

        doc1 = Nokogiri::XML(small_xml)
        a2 = Hash.from_xml(doc1.to_xml)

        a2["response"]['result']['msg']
      end
    end

    def self.decode(xml)

      #ActiveResource::Formats::XmlFormat.decode(xml)
      doc = Nokogiri::XML(xml)
      a1 = Hash.from_xml(doc.to_xml)

      if !a1.nil?
        if a1["Envelope"]["Body"]["DescribeResponse"].nil?
          if a1["Envelope"]["Body"]["ProcessRequestResponse"].nil?
            if a1["Envelope"]["Body"]["CheckAvailabilityResponse"].nil?
              if a1["Envelope"]["Body"]["OrderDomainsResponse"].nil?
                if a1["Envelope"]["Body"]['PollResponse'].nil?
                  if a1["Envelope"]["Body"]['OrderDomainPrivacyResponse'].nil?
                    if a1["Envelope"]["Body"]['InfoResponse'].nil?
                      small_xml =  a1["Envelope"]["Body"]['ValidateRegistrationResponse']['ValidateRegistrationResult']
                    else
                      small_xml =  a1["Envelope"]["Body"]['InfoResponse']['InfoResult']
                    end
                  else
                    small_xml =  a1["Envelope"]["Body"]['OrderDomainPrivacyResponse']['OrderDomainPrivacyResult']
                  end
                else
                  small_xml = a1["Envelope"]["Body"]['PollResponse']['PollResult']
                end
              else
                small_xml = a1["Envelope"]["Body"]["OrderDomainsResponse"]["OrderDomainsResult"]
              end
            else
              small_xml = a1["Envelope"]["Body"]["CheckAvailabilityResponse"]["CheckAvailabilityResult"]
            end
          else
            small_xml = a1["Envelope"]["Body"]["ProcessRequestResponse"]["ProcessRequestResult"]
          end
        else
          small_xml = a1["Envelope"]["Body"]["DescribeResponse"]["DescribeResult"]
        end

        puts "small xml == #{small_xml}"

        doc1 = Nokogiri::XML(small_xml)
        a2 = Hash.from_xml(doc1.to_xml)

        result = nil
        if !a2["response"].nil?
          result = a2["response"]
        elsif !a2["info"].nil?
          result = a2["info"]
        elsif !a2["validateRegistration"].nil?
          result = a2["validateRegistration"]
        else
          result = a2["check"]
        end

        result
      end

    end

    def self.escape_html(string)
      string.to_s.gsub("&", "&amp;").
        gsub("<", "&lt;").
        gsub(">", "&gt;").
        gsub("'", "&#39;").
        gsub('"', "&quot;")
    end

    # Encodes correctly for cookies, e.g. key1=value1; key2=value2
    def self.xml_encode_hash(hash)
      result = '';
      hash.keys.map(&:to_s).sort.each do |k|
        v = hash[k.to_sym]

        if v.is_a?(Array)
          result << v.map { |vh| xml_encode_hash({ k.to_sym => vh }) }.join
        elsif v.is_a?(Hash)
          result << "<#{k.to_s}"

          if v.key?(:_attributes) # save all the attributes
            v[:_attributes].keys.map(&:to_s).sort.each do |attrk|
              attrv = v[:_attributes][attrk.to_sym]
              result << " #{attrk.to_s}=\"#{attrv.to_s}\""
            end
            v.delete(:_attributes)
          end

          if v.empty?
            result << ' />'
          else
            result << '>' << xml_encode_hash(v) << "</#{k.to_s}>"
          end
        else
          result << "<#{k.to_s}>"
          result << "#{v.to_s}"
          result << "</#{k.to_s}>"
        end
      end
      result
    end

    # Encodes correctly for cookies, e.g. key1=value1; key2=value2
    def self.cookie_encode_hash(hash)
      pairs = Array.new
      hash.each_pair do |k,v|
        pairs << "#{CGI::escape(k.to_s)}=#{CGI::escape(v.to_s)}" unless v.blank?
      end
      pairs.join('; ')
    end


    attr_reader :site, :timeout, :cookies

    # Execute a POST request for the SOAP request
    def soap(action, body = '', headers = {})
      request(:post, '',
        (body.is_a?(Hash) ? self.class.wrap_with_header_xml(self.class.xml_encode_hash(body)) : body.to_s),
        build_request_headers(headers.update({ 'SOAPAction' => "\"http://wildwestdomains.com/webservices/#{action}\""}), :post)
      )
    end

    # Set URI for remote service.
    def site=(site)
      @site = site.is_a?(URI) ? site : URI.parse(site)
    end

    # Set the number of seconds after which HTTP requests to the remote service should time out.
    def timeout=(timeout)
      @timeout = timeout
    end

    # Calls update on the cookies hash
    def update_cookies(hash)
      @cookies = {} unless @cookies
      @cookies.update(hash)
    end

    # Makes request to remote service.  # Be sure to handle Timeout::Error
    def request(method, path, *arguments)
      puts "INSIDE ACTION REQUEST"
      logger.info "#{method.to_s.upcase} #{site.scheme}://#{site.host}:#{site.port}#{site.path}#{site.query ? '?' + site.query : ''}#{path}" if logger
    logger.info "with body: #{arguments.inspect}" if logger
      result = nil

      #DATNT Note: bechmark action here cause error: "Duplicate transaction id"
      # It's because our application send POST to server with the same clTRID, which is a wrong idea
      #ms = Benchmark.ms { result = http.send(method, "#{site.path}#{site.query ? '?' + site.query : ''}#{path}", *arguments) }

      result = http.send(method, "#{site.path}#{site.query ? '?' + site.query : ''}#{path}", *arguments)

      #logger.info "--> %d %s (%d %.0fms)" % [result.code, result.message, result.body ? result.body.length : 0, ms] if logger
      handle_response(result)
      # rescue Timeout::Error => e
      #   raise TimeoutError.new(e.message)
    end

    # Handles response and error codes from remote service.
    def handle_response(response)
      case response.code.to_i
        when 301,302
          raise(ConnectionError.new(response, "Redirection response code: #{response.code}"))
        when 200...400
          response
        else
          raise(ConnectionError.new(response, "Connection response code: #{response.code}"))
      end
    end

    # Creates new Net::HTTP instance for communication with remote service and resources.
    def http
      http             = Net::HTTP.new(@site.host, @site.port)
      http.use_ssl     = @site.is_a?(URI::HTTPS)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http.read_timeout = @timeout if @timeout # If timeout is not set, the default Net::HTTP timeout (60s) is used.
      http.set_debug_output $stderr #if RAILS_ENV == 'development'
      http
    end


    # Builds headers for request to remote service.
    def build_request_headers(headers, http_method=nil)
      http_format_header(http_method).update(default_reseller_headers).update(cookie_header).update(headers)
    end

    def default_reseller_headers
      { 'POST' => "/wswwdapi/wapi.asmx HTTP/1.1",
        'Host' => "api.ote.wildwestdomains.com" }
    end

    # Builds the cookie header according to what's stored in @cookies
    def cookie_header
      @cookies.nil? || @cookies.empty? ? {} : { 'Cookie' => self.class.cookie_encode_hash(@cookies) }
    end

    def http_format_header(http_method)
      {HTTP_FORMAT_HEADER_NAMES[http_method] => XML_MIME_TYPE}
    end

    def logger
      defined?(ActiveRecord) ? ActiveRecord::Base.logger : nil
    end
  end
end