class ProductsController < ApplicationController
  def index
    render :text => "hello world"
  end
  def new
    @product = Product.new
  end
end
