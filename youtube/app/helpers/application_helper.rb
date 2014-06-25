module ApplicationHelper
  def youtube_token
    youtube_auth = YoutubeAuth.first
    access_token = nil
    if youtube_auth.nil?
    else
      refresh_token = youtube_auth.refresh_token

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
      access_token = refresh.parsed_response["access_token"]
      session[:youtube_token] = access_token
      session[:youtube_refresh] = youtube_auth.refresh_token
      session[:youtube_expires_at] = youtube_auth.expires_at
    end
    access_token
  end
end
