class LinkGasController < ApplicationController
#  require 'google/api_client'
  
  def index
    prepare_profile
    get_city_data
  end
  
  
  
end
