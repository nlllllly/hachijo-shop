class AdminsController < ApplicationController
  # User以外（Admin）は「:index」「:show」のみアクセスできる
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # Admin以外（User）は一切のアクセスができない
  before_action :authenticate_admin!

  
  def index
  end
  def show
    @admin = Admin.find(params[:id])
  end

  
end
