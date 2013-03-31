class CategoriesController < ApplicationController
  before_filter :authorize, only: [:edit, :update]
  
  def index
    @categories = Category.all
  end
  def new
    @category = Category.new
  end
  def create
    
  end
end
