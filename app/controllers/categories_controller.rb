class CategoriesController < ApplicationController
  def index
    @categories = Category.page(params[:page]).per(30)
  end

  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admins_categories_path, notice: '登録が完了しました！'
    else
      render :new
    end
  end
  def edit
    @category= Category.find(params[:id])
  end
  def update
    @category= Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admins_categories_path, notice: '更新が完了しました！'
    else
      render :edit
    end
    
  end
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admins_categories_path, notice: '削除が完了しました！'
  end

  private
    def category_params
      params.require(:category).permit(:category_name)
    end
end
