class ProductsController < ApplicationController
  def index
    render :text => "hello world"
  end
  def new
    @product = Product.new
  end
  def create
    product_params = params.require(:product).permit(:sub_category_id, :name, :description)
    @product = Product.new(product_params)
    if @product.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
end
