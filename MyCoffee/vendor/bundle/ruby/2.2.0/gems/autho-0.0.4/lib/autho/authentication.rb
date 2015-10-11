require "attr_extras"
require "bcrypt"

module Autho
  class Authentication
    pattr_initialize :finder, :email, :password

    def user
      user = finder.find_by_email(email)
      user && authenticate(user, password)
    end

    private

    def authenticate(user, unencrypted_password)
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "***********"
      puts "*********** unencrypted_password == "
      puts "*********** unencrypted_password == #{unencrypted_password}"
      # This is BCcrypt being cryptic. It overrides "==" to compare hashes.
      if BCrypt::Password.new(user.password_digest) == unencrypted_password
        user
      else
        nil
      end
    end
  end
end
