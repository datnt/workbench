class CategoriesController < ApplicationController
  before_filter :authorize, only: [:edit, :update]
  
  def index
    @categories = Category.all
  end
  def new
    @category = Category.new
  end
  def create
    @category  = Category.new(params[:category])
    @category.save
    redirect_to :action => "index"
  end
  def edit
    @category = Category.find(params[:id])
  end
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to @category, notice: "Category has been updated."
    else
      render "edit"
    end
  end
  def show
    @category = Category.find(params[:id])
  end
end
