class ApplicationController < ActionController::Base
  require 'google/api_client'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
  def prepare_profile
    begin
      @client = Google::APIClient.new
      if Rails.env == "development"
        key = Google::APIClient::PKCS12.load_key("#{Rails.root}/config/ga_client_dev.p12", 'notasecret')
        
        @client.authorization = Signet::OAuth2::Client.new(
          :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
          :audience => 'https://accounts.google.com/o/oauth2/token',
          :scope => 'https://www.googleapis.com/auth/analytics.readonly',
          :issuer => '303169260475-6v15n9sdv77e68vaco8r22eofsnfh9km@developer.gserviceaccount.com',
          :signing_key => key)
      end
      
      token = @client.authorization.fetch_access_token!
      
      session[:firstProfileId] = GOOGLE_ANALYTICS_PROFILE_ID
      
    rescue => e
      logger.info "#{e.backtrace.join("\n")}"
    end
  end
  
  def get_city_data
    @str_start = "2013-05-20"#(Time.now - 120.days).strftime("%Y-%m-%d") 
    @str_end = "2013-07-02"#Time.now.strftime("%Y-%m-%d")
    @page_path = "ga:pagePath==/topics/test-ie10"
    begin
      @city_statistics = @client.execute(
        :api_method => @client.discovered_api('analytics', 'v3').data.ga.get,
        :parameters => {
          ids: "ga:#{session[:firstProfileId]}",
          :"start-date" => @str_start,
          :"end-date" => @str_end,
          dimensions: "ga:country,ga:city",
          metrics: "ga:visits",
          filters: @page_path
        })
    rescue => e
      logger.info "#{e.backtrace.join("\n")}"
    end
  end
end
