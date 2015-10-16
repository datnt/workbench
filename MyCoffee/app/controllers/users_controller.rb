class UsersController < ApplicationController
  skip_before_filter :ensure_user_is_authenticated
  def new
    render :text => "register for a new user"
  end
end
