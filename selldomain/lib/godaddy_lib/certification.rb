module GoDaddyReseller
  # This module helps with the api reseller certification process, and is not needed after certification.
  # Steps to certification:
  #   (1) go to https://www.ote.resellerextranet.com,
  #   (2) add your testing server's ip address (no certificate name needed) by navigating to 'IP Address Configuration'
  #   (3) enable certification mode by navigating to 'Certification Status', checking the box, and applying it
  #   (4) run certification by going into <code>script/console</code>, and running
  #        > godaddy = GoDaddyReseller::API.new('api_username', 'api_password');
  #        > godaddy.run_certification
  #  All 7 steps should complete without raising a GoDaddyResellerError.  Each step outputs to STDERR.
  module Certification

    # Runs the 7 certification tasks
    #  - Domain name availability check
    #  - Domain name registration
    #  - Domain name privacy purchase
    #  - Domain name availability check
    #  - Domain name information query
    #  - Domain name renewal
    #  - Domain name transfer
    def run_certification
      #DATNT NOTE: we should not execute run_certification
      # => instead, we will move each action within run_certification into
      # => different module of function on the GUI interface.
      #
      # DATNT: BEGIN PURCHASE ORDER
#      reset_certification_run
#
#      overall_domain = "examplejun52"
#
#      STDERR.print("1. Check Availability (should be available):\n")
#      #result = check_availability(["#{overall_domain}.us", "#{overall_domain}.biz"])
#      result = check_availability(["#{overall_domain}.biz"])
#      STDERR.print("++ #{result.inspect}\n\n")
#
#      new_reg = domain_name_registration_certification(overall_domain)
#
#      puts "VALUE OF NEW_REG == #{new_reg}"
      # DATNT: END PURCHASE ORDER



#      new_priv = domain_name_privacy_purchase_certification(new_reg[:orderid], new_reg[:user_id], overall_domain)
#
#      STDERR.print("4. Domain Name Availability Check (should *not* be available):\n")
#      #result = check_availability(["#{overall_domain}.us", "#{overall_domain}.biz"])
#      result = check_availability(["#{overall_domain}x.biz", "#{overall_domain}.biz"])
#      STDERR.print("++ #{result.inspect}\n\n")
#
#      STDERR.print("5. Domain Name Information Query:\n")
#      result = info_by_resource_id(GoDaddyReseller::WAPI::Util.find_by_riid_and_orderid_from_poll_result(2, new_reg[:orderid], polls.last)[:resourceid])
#      STDERR.print("++ #{result.inspect}\n\n")
#
#      domain_name_renewal_certification(new_reg[:orderid], new_priv[:orderid], new_reg[:user_id], new_priv[:dbpuser_id], overall_domain)
#
#      domain_name_transfer_certification(overall_domain)

      true
    end

    def validate_registration(domainContacts, domainDataArray)
      wapi_validate_registration(domainContacts, domainDataArray)
    end

    # Resets the certification tasks, in case something went wrong during certification
    def reset_certification_run
      response = process_request("<manage><script cmd='reset' /></manage>")
      result = c.class.soap_response_text(response.body)

      return result == 'scripting status reset'
    end

    def domain_name_transfer_certification(domain_value)

      STDERR.print("7. Domain Name Transfer:\n")

      user_hash = {
        :fname => 'Joe',
        :lname => 'Smith',
        :email => 'joe@smith.us',
        :sa1 => '1 S. Main St.',
        :city => 'Oakland',
        :sp => 'California',
        :pc => '97123',
        :cc => 'United States',
        :phone => '(777)555-1212'
      }

      result = order_domain_transfers({
        :shopper => {
          :user => 'createNew',
          :pwd => 'ghijk',
          :pwdhint => 'ghijk',
          :email => user_hash[:email],
          :firstname => user_hash[:fname],
          :lastname => user_hash[:lname],
          :phone => user_hash[:phone],
          :pin => '1234'
        },
        :items => {
          :DomainTransfer => [
            {
              :order => {
                :productid => GoDaddyReseller::ProductTable::HASH['Transfer .COM'],
                :quantity => 1,
                :riid => 7,
                :duration => 1
              },
              :sld => "#{domain_value}",
              :tld => 'com'
            }
          ]
        }
      })
      STDERR.print("++ #{result.inspect}\n\n")
    end

    def query_poll
      poll_full
    end

    def domain_name_renewal_certification(original_order_id, privacy_order_id, new_user_id, new_dbp_user_id, domain_value)
      STDERR.print("6. Domain Name Renewal:\n")
      polled_privacy_orders = poll
      STDERR.print("+++ polling for last privacy order: #{polled_privacy_orders.inspect}\n\n")

      result = order_private_domain_renewals({
        :shopper => {
          :user => new_user_id,
          :dbpuser => new_dbp_user_id,
          :dbppwd => 'defgh' # XXX for some reason, the password is required to be passed in to pass this test.
        },
        :items => {
          :DomainRenewal => [
            {
              :order => {
                #:productid => GoDaddyReseller::ProductTable::HASH['1 Year Domain Renewal .US'],
                :productid => GoDaddyReseller::ProductTable::HASH['1 Year Domain Renewal .BIZ'],
                :quantity => 1,
                :riid => 4,
                :duration => 1
              },
              :resourceid => GoDaddyReseller::WAPI::Util.find_by_riid_and_orderid_from_poll_result(1, original_order_id, polls.first)[:resourceid],
              :sld => "#{domain_value}",
              #:tld => 'us',
              :tld => 'biz',
              :period => 1
            },
            {
              :order => {
                :productid => GoDaddyReseller::ProductTable::HASH['1 Year Domain Renewal .BIZ'],
                :quantity => 1,
                :riid => 5,
                :duration => 1
              },
              :resourceid => GoDaddyReseller::WAPI::Util.find_by_riid_and_orderid_from_poll_result(2, original_order_id, polls.first)[:resourceid],
              :sld => "#{domain_value}",
              :tld => 'biz',
              :period => 1
            }
          ]
        },
        :dbpItems => {
          :ResourceRenewal => [
            {
              :order => {
                :productid => GoDaddyReseller::ProductTable::HASH['Private Registration Services Renewal - API'],
                :quantity => 1,
                :riid => 6,
                :duration => 1
              },
              :resourceid => GoDaddyReseller::WAPI::Util.find_by_riid_and_orderid_from_poll_result(3, privacy_order_id, polled_privacy_orders)[:resourceid]
            }
          ]
        }
      })

      STDERR.print("++ #{result.inspect}\n\n")
    end

    def domain_name_privacy_purchase_certification_from_db(new_order_id, new_user_id, domain_value, resource_id)
      #Datnt: this action will not perform the poll, different with the below action

      result = order_domain_privacy({
        :shopper => {
          :user => new_user_id,
          :dbpuser => 'createNew',
          :dbppwd => 'defgh',
          :dbppwdhint => 'defgh',
          #:dbpemail => "info@#{domain_value}.us",
          :dbpemail => "info@#{domain_value}.biz",
          :dbppin => '1234'
        },
        :items => {
          :DomainByProxy => [
            {
              :order => {
                :productid => GoDaddyReseller::ProductTable::HASH['Private Registration Services - API'],
                :quantity => 1,
                :riid => 3,
                :duration => 2
              },
              :sld => "#{domain_value}",
              #:tld => 'us',
              :tld => 'biz',
              :resourceid => resource_id
            }
          ]
        }
      })
      STDERR.print("++ #{result.inspect}\n\n")

      return result
    end
    def domain_name_privacy_purchase_certification(new_order_id, new_user_id, domain_value)
      STDERR.print("3. Domain Name Privacy Purchase:\n")
      polled_orders = poll
      STDERR.print("+++ polling for last order: #{polled_orders.inspect}\n\n")

      result = order_domain_privacy({
        :shopper => {
          :user => new_user_id,
          :dbpuser => 'createNew',
          :dbppwd => 'defgh',
          :dbppwdhint => 'defgh',
          #:dbpemail => "info@#{domain_value}.us",
          :dbpemail => "info@#{domain_value}.biz",
          :dbppin => '1234'
        },
        :items => {
          :DomainByProxy => [
            {
              :order => {
                :productid => GoDaddyReseller::ProductTable::HASH['Private Registration Services - API'],
                :quantity => 1,
                :riid => 3,
                :duration => 2
              },
              :sld => "#{domain_value}",
              #:tld => 'us',
              :tld => 'biz',
              :resourceid => GoDaddyReseller::WAPI::Util.find_by_riid_and_orderid_from_poll_result(1, new_order_id, polled_orders)[:resourceid]
            }
          ]
        }
      })
      STDERR.print("++ #{result.inspect}\n\n")

      return result
    end

    def domain_name_registration_certification(order_object)
      #NOTE: name_server format : [ { :name => 'ns1.example.com' }, { :name => 'ns2.example.com' } ]
      STDERR.print("2. Domain Name Registration PROCESSING:\n")
      
      domain_value =  order_object[:domain_value]
      user_hash = order_object[:user_hash] 
      domain_type = order_object[:domain_type]
      product_id = order_object[:product_id]
      order_period = order_object[:order_period]
      user_password = order_object[:user_password]


      result = order_domains({
        :shopper => {
          :user => 'createNew',
          #:pwd => 'abcde',
          :pwd => user_password,
          :pwdhint => 'abcde',
          :email => user_hash[:email],
          :firstname => user_hash[:fname],
          :lastname => user_hash[:lname],
          :phone => user_hash[:phone],
          :pin => '1234'
        },
        :items => {
          :DomainRegistration => [
            {
              :order => {
                :productid => product_id, #GoDaddyReseller::ProductTable::HASH['2 Year Domain New Registration .BIZ'],
                :quantity => 1,
                :riid => 1,
                :duration => 1
              },
              :sld => "#{domain_value}",
              :tld => domain_type,
              :period => order_period,
              :registrant => user_hash,
              #:nsArray => { :NS =>  name_servers },
              :admin => user_hash,
              :billing => user_hash,
              :tech => user_hash,
              :autorenewflag => 1
            }
          ]
        }
      })
      STDERR.print("++ #{result.inspect}\n\n")

      return result
    end

  end
end