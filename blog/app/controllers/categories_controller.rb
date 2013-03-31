class CategoriesController < ApplicationController
  before_filter :authorize, only: [:edit, :update]
  
  def index
    @articles = Article.all
  end
end
