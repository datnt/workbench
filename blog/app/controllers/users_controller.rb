class UsersController < ApplicationController
  def new
    if current_user
      redirect_to root_url, notice: "You are currently logged in!"
    end
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end
end
