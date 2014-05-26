class Product < ActiveRecord::Base
  belongs_to :sub_category
  
  validates_presence_of :sub_category_id
  validates_presence_of :name
  validates_presence_of :description
end
