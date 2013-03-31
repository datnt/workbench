class CategoriesController < ApplicationController
  before_filter :authorize, only: [:edit, :update]
  
  def index
    @categories = Category.all
  end
end
