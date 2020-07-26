class ProductsController < ApplicationController
  # 非会員でも「:index, :show, :search」を可能にする。
  skip_before_action :authenticate_user!, only: [:index, :show, :search]
  skip_before_action :authenticate_admin!, only: [:index, :show, :search]
  # User以外（Admin）は全ての操作ができる。
  before_action :authenticate_user!, except: [:index, :show, :search, :new, :create, :edit, :update, :destroy]


  def index
    @products = Product.page(params[:page]).per(30)
  end
  def show
    @product = Product.find(params[:id])
    
    @cart_item = CartItem.new

  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    @product.admin_id = current_admin.id
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
  def search
    if params[:name].present?
      @products = Product.page(params[:page]).per(30).where('name LIKE ?', "%#{params[:name]}%")
    else
      @products = Product.page(params[:page]).per(30).none
    end
  end



  private
    def product_params
      params.require(:product).permit(:name, :price, :explanation, :stock, :admin_id, :product_image, :category)
    end

  
end
