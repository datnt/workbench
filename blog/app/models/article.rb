class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  acts_as_commentable

  
end
