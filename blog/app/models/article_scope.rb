class ArticleScope < ActiveRecord::Base
  belongs_to :article
  has_many :category

end
