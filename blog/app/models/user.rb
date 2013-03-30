class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :password, :password_confirmation
  has_many :articles, :dependent => :destroy
  
  validates_uniqueness_of :email

  def self.authenticate(user_email, password)
    user = self.find_by_email(user_email)
    if user && user.authenticate(password)
      return user
    else
      puts "wrong username or password"
    end
  end
end
