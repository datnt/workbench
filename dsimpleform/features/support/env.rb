require 'capybara/cucumber'
require 'rspec/expectations'
require 'cucumber/rails'

Capybara.javascript_driver = :selenium

#Capybara.default_driver = :selenium
#
#Capybara.default_driver = :rack_test
#Capybara.register_driver :selenium do |app|
#  Capybara::Selenium::Driver.new(app, :browser => :chrome)
#end

#
#Capybara.configure do |config|
#  config.run_server = false
#  #config.default_driver = :selenium
#  config.default_driver = :rack_test
#  config.app_host = 'http://localhost:3000' # change url
#end
