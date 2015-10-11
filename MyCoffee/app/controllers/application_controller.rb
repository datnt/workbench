class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :ensure_user_is_authenticated

  def self.skip_user_authentication(opts = {})
    skip_before_filter :ensure_user_is_authenticated, opts
  end

  def user_session
  	puts "---"
  	puts "---"
  	puts "---"
  	puts "---"
  	puts "---"
  	puts "---"
  	puts "---"
  	puts "---"
  	puts "---"
  	puts "---"
  	puts "---"
  	puts "---"
  	puts "--- params == "
  	puts "--- params == #{params}"
  	puts "--- "
  	puts "--- :: "
  	a = Autho::Session.new(self, :user_id, User)
  	puts "--- :: #{a}"
    @user_session ||= a
  end

  private

  def ensure_user_is_authenticated
    unless current_user
      redirect_to login_path, alert: t(:"sessions.must_authenticate")
    end
  end

  def current_user
    user_session.user
  end
  helper_method :current_user
end
