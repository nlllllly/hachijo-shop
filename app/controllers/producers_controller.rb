class ProducersController < ApplicationController
  # ゲストユーザでも「index」へはアクセスが可能。
  skip_before_action :authenticate_user!, only: [:list, :show]
  skip_before_action :authenticate_admin!, only: [:list, :show]
  # User以外（Admin）は全ての操作ができる。
  before_action :authenticate_user!, except: [:index, :list, :show, :search, :new, :create, :edit, :update, :destroy]


  def index
    @producers = Producer.page(params[:page]).per(10)
  end

  def show
    @producer = Producer.find(params[:id])
  end
  def list
    @producers = Producer.page(params[:page]).per(10)
  end

  def new
    @producer = Producer.new
  end
  def create
    @producer = Producer.new(producer_params)
    if @producer.save
      redirect_to admins_producers_path, notice: '登録が完了しました！'
    else
      render :new
    end
  end
  def edit
    @producer = Producer.find(params[:id])
  end
  def update
    @producer = Producer.find(params[:id])
    if @producer.update(producer_params)
      redirect_to admins_producers_path, notice: '更新が完了しました！'
    else
      render :edit
    end
  end
  def destroy
    @producer = Producer.find(params[:id])
    @producer.destroy
    redirect_to admins_producers_path, notice: '削除が完了しました！'
  end

  private
    def producer_params
      params.require(:producer).permit(:producer_name, :explanation, :url, :producer_image)
    end


end
