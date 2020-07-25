class UsersController < ApplicationController
  # User以外（Admin）は「:index」「:show」のみできる
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # Admin以外（User）は「:show」「:new」「:create」「:edit」「:update」「:destroy」のみアクセスできる。
  before_action :authenticate_admin!, only: [:index]

  def show
    @user = User.find(params[:id])
  end

end
