class HomeController < ApplicationController
    # ゲストユーザでも「index」へはアクセスが可能。
    skip_before_action :authenticate_user!, only: [:index]
    skip_before_action :authenticate_admin!, only: [:index]

    def index
        @products_crt = Product.all.order(created_at: :desc).limit(10)
        @products_fav = Product.all.limit(10)
    end
end
