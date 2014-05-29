class Phone < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :phone_type, :number
  
  belongs_to :contact
  
  validates :phone, uniqueness: { scope: :contact_id }
end
