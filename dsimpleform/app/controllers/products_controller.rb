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
  def show
    
  end
  def images
    
    items = [
      {
        media: {
          m: "http://upload.wikimedia.org/wikipedia/en/thumb/e/e8/WC-2014-Brasil.svg/640px-WC-2014-Brasil.svg.png"
        }
      },
      {
        media: {
          m: "http://thumbs.media.smithsonianmag.com//filer/two-male-lions-Kenya-631.jpg__800x600_q85_crop.jpg"
        }
      },
      {
        media: {
          m: "http://i.telegraph.co.uk/multimedia/archive/01795/china-dragon_1795137b.jpg"
        }
      },
      {
        media: {
          m: "http://www.nasa.gov/images/content/145956main_NTR_borowskii.jpg"
        }
      }
    ]
    obj = {
      items: items
    }
    render :json => obj
  end
end
