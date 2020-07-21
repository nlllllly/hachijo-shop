class ProductsController < ApplicationController
  # User以外（Admin）は全ての操作ができる。
  before_action :authenticate_user!, except: [:index, :show, :new, :create, :edit, :update, :destroy]
  # Admin以外（User)は「:index」「:show」のみできる
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

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
  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product.id)
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path

  end



  private
    def product_params
      params.require(:product).permit(:name, :price, :explanation, :stock, :admin_id, :product_image_id)
    end

  
end
