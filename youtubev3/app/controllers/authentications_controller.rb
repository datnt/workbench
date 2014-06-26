require 'google/api_client'
require 'google/api_client/client_secrets'

YOUTUBE_SCOPE = 'https://www.googleapis.com/auth/youtube'

class AuthenticationsController < ApplicationController
  before_filter :init
  def index
    saved_credential = YoutubeV3Auth.first
    if saved_credential.nil?
      auth = @authorization
      @url = @authorization.authorization_uri().to_s
    else
      refresh_the_access_token(saved_credential)
    end
  end
  
  def create
    #Here is the result that google callback provide
    #{
    #"code"=>"...", 
    #"controller"=>"authentications", 
    #"action"=>"create", 
    #"provider"=>"google_oauth2"}
    if params[:provider] == "google_oauth2"
      @authorization.code = params[:code]
      begin
        result = @authorization.fetch_access_token!
        #Here is the result of action fetch_access_token, we should store this into database
        #then next time, we use refresh_token to get access_token, 
        #instead of perform the whole process again
        #
        #result =
        #{
        #"access_token"=>"...", 
        #"token_type"=>"Bearer", 
        #"expires_in"=>3600, 
        #"refresh_token"=>"..."}
        puts "result == #{result}"
        puts "token == #{result["access_token"]}"
        puts "token == #{result[:access_token]}"
        YoutubeV3Auth.create(
          :access_token => result['access_token'],
          :token_type => result['token_type'],
          :expires_in => result['expires_in'],
          :refresh_token => result['refresh_token']
        )
      rescue => e
        puts "Error occurs while fetch_access_token"
      end
    end
    render :text => "create"
  end
  
  def new
    
  end
  
  def upload
    puts "p == "
    puts "p == #{params}"
    params[:file_upload]
    render :text => "Done"
  end
  
  protected
  def init
    scope = YOUTUBE_SCOPE
    credentials = Google::APIClient::ClientSecrets.load("#{Rails.root}/config/client_secret.json")
    @authorization = Signet::OAuth2::Client.new(
      :authorization_uri => credentials.authorization_uri,
      :token_credential_uri => credentials.token_credential_uri,
      :client_id => credentials.client_id,
      :client_secret => credentials.client_secret,
      :redirect_uri => credentials.redirect_uris.first,
      :scope => scope
    )
  end
  def refresh_the_access_token(saved_credential)
    @access_token = nil
    refresh_token = saved_credential.refresh_token
    options = {
      body: {
        client_id: MY_YOUTUBE_CONFIG[:client_id],
        client_secret: MY_YOUTUBE_CONFIG[:client_secret],
        refresh_token: "#{refresh_token}",
        grant_type: "refresh_token"
      },
      headers: {
        "Content-Type" => "application/x-www-form-urlencoded"

      }
    }
    refresh = HTTParty.post("https://accounts.google.com/o/oauth2/token", options)
    @access_token = refresh.parsed_response["access_token"]
    #Store this token for later usage
    session[:youtube_token] = @access_token
  end
end
