class CreateArticleScopes < ActiveRecord::Migration
  def change
    create_table :article_scopes do |t|
      t.belongs_to :article, :null => false
      t.belongs_to :category, :null => false

      t.timestamps
    end
  end
end
