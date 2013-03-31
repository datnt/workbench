class Category < ActiveRecord::Base
  attr_accessible :name, :description
  validates_uniqueness_of :email
end
