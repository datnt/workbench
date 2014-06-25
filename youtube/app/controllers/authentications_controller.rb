class AuthenticationsController < ApplicationController
  before_filter :refresh_youtube_token, :only => :new
  def create
    omniauth = request.env["omniauth.auth"]
    if omniauth['provider'] == "youtube" && omniauth['info']['email'] == MY_YOUTUBE_CONFIG[:host_email]
      youtube_auth = YoutubeAuth.find_by_email(omniauth['info']['email'])
      if youtube_auth.nil?
        #we create object only 1 time
        #other time, we will use the refresh token
        YoutubeAuth.create!(
          :user_id => 1,#current_user.id,
          :provider => omniauth['provider'],
          :uid => omniauth['uid'],
          :email => omniauth['info']['email'],
          :refresh_token => omniauth['credentials']['refresh_token'],
          :expires_at => omniauth['credentials']['expires_at']
        )
      end 
    end
  end
  
  def new
    
  end
  
  def upload
    client_id = MY_YOUTUBE_CONFIG[:client_id]
    client_secret = MY_YOUTUBE_CONFIG[:client_secret]
    dev_key = MY_YOUTUBE_CONFIG[:dev_key]

    access_token = session[:youtube_token]
    refresh_token = session[:youtube_refresh]
    expiration = session[:youtube_expires_at]


    client = YouTubeIt::OAuth2Client.new(client_access_token: access_token, client_refresh_token: refresh_token, client_id: client_id, client_secret: client_secret, dev_key: dev_key, expires_at: "")

    nonce = SecureRandom.hex()
    youtube_response = client.video_upload(
      params[:post_file].tempfile,
      :title => "#{nonce}",
      :description => 'Experience_video',
      :category => 'People',
      :keywords => %w[tournative tour tourist tourguide]
    )

    video_id = youtube_response.video_id.split(":").last
    experience_id = params[:id]
    object_viceo = {
      :video_id => video_id
    }
    puts "object video == #{object_viceo}"
    #ExperienceVideo.create(:video_id => video_id, :experience_id => resource.id)

    render :text => "#{youtube_response.to_json}"
  end

  
  protected
  def refresh_youtube_token
    begin
      youtube_auth = YoutubeAuth.first
      access_token = nil
      if youtube_auth.nil?
      else
        refresh_token = youtube_auth.refresh_token


        options = {
          body: {
            client_id: AppSettings.social_networks.youtube.client_id,
            client_secret: AppSettings.social_networks.youtube.client_secret,
            refresh_token: "#{refresh_token}",
            grant_type: "refresh_token"
          },
          headers: {
            "Content-Type" => "application/x-www-form-urlencoded"

          }
        }
        refresh = HTTParty.post("https://accounts.google.com/o/oauth2/token", options)
        access_token = refresh.parsed_response["access_token"]
        session[:youtube_token] = access_token
        session[:youtube_refresh] = youtube_auth.refresh_token
        session[:youtube_expires_at] = youtube_auth.expires_at
      end
    rescue
      puts "Failed to refresh youtube token"
    end
    
  end
end
