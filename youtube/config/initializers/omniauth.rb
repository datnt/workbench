Rails.application.config.middleware.use OmniAuth::Builder do
  provider :youtube, MY_YOUTUBE_CONFIG[:client_id], MY_YOUTUBE_CONFIG[:client_secret], authorize_params: { :access_type => 'offline', :approval_prompt => 'force' }
end
