class AdminsController < ApplicationController
  # User以外（Admin）は「:show」「:new」「:create」「:edit」「:update」「:destroy」のみアクセスできる
  before_action :authenticate_user!, only: [:index]
  # Admin以外（User）は一切のアクセスができない
  before_action :authenticate_admin!


  def show
    @admin = Admin.find(params[:id])
  end

  
end
