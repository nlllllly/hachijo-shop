class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def show
    @product = Product.find(params[:id])
  end
  def new
    @product = Product.new
    
  end
  def create
    @product = Product.new(product_params)
    @product.admin_id = current_user.id
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end



  private
    def product_params
      params.require(:product).permit(:name, :price, :explanation, :stock, :admin_id, :product_image_id)
    end

  
end
