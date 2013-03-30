class HomesController < ApplicationController
  def index
    app_id="8b08fd049e27b76e3fef76a618ed5e21b1a58aade53b9c6ccfaee3a2f6126f62"
    secret="510ac64ceaf449cd7c7f5ced7233a5655d4d7c1ff6873b3f39c52ab45cab27d6"

    client1=OAuth2::Client.new(app_id,secret,site:"http://localhost:3000/")
    access_token = client1.password.get_token('ngothiendat@gmail.com', '111111')
    puts access_token.token
  end
  def login
    
  end
  def authentication
    begin
      app_id="8b08fd049e27b76e3fef76a618ed5e21b1a58aade53b9c6ccfaee3a2f6126f62"
      secret="510ac64ceaf449cd7c7f5ced7233a5655d4d7c1ff6873b3f39c52ab45cab27d6"

      client1=OAuth2::Client.new(app_id,secret,site:"http://localhost:3000/")
      access_token = client1.password.get_token(params[:email], params[:password])

      render :text => access_token.token
    rescue
      render :text => 'login failed'
    end

  end
end
