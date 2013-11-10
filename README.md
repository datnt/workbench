demoblog
========

Demo Blog Application

DatNT note:
In order to allow Rails application accept the cross-domain request from client, we need to use gem rack-cors
1> Declar in Gemfile as below

gem 'rack-cors', :require => 'rack/cors'

2> Within file config/application.rb, within the scope of "class Application < Rails::Application", add the following code:

    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end


=========
Below is the custom authentication for Opro Oauth. Here is the convention:
1> If user submit useremail & password then authen by user & password
2> If not then authen by credential of application owner.


Opro.setup do |config|

  ## Configure the auth_strategy or use set :login_method, :logout_method, & :authenticate_user_method
  
  #config.auth_strategy = :devise
  

  config.login_method             { |controller, current_user| controller.sign_in(current_user, :bypass => true) }
  
  config.logout_method            { |controller, current_user| controller.sign_out(current_user) }
  
  config.authenticate_user_method { |controller| controller.authenticate_user! }
  
  config.find_user_for_auth do |controller, params|
  
    user = User.find_by_email(params[:username])
    
    if user
    
      if !user.valid_password?(params[:password])
      
        return false
        
      end
      
    elsif params[:username] == ""
    
      app = Opro::Oauth::ClientApp.where(:app_id => params[:client_id]).where(:app_secret => params[:client_secret]).first
      
      if app
      
        user = app.user
        
      else
      
        false
        
      end
      
    else
    
      false
      
    end

    user
    
  end

end

3> Another issue arise when deploy API to production is 
a. verify csrf token, so I turned it off by below code for API controllers
skip_before_filter :verify_authenticity_token
b. I have issue with nginx, when URL is "abc_domain.com", then I fix issue by addiing www to API URL "www.abc_domain.com"
