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
