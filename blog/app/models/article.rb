class Article < ActiveRecord::Base
  has_many :comments
  has_many :article_scopes
  belongs_to :user

  acts_as_commentable

  def categories
    Category.where("id in (?)",self.article_scopes.map(&:category_id))
  end
  
end
