class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :password, :password_confirmation
  has_many :articles, :dependent => :destroy
  
  validates_uniqueness_of :email
end