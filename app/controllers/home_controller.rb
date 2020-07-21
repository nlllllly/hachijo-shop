class HomeController < ApplicationController
    # ゲストユーザでも「index」へはアクセスが可能。
    skip_before_action :authenticate_user!, only: [:index]
    skip_before_action :authenticate_admin!, only: [:index]
end
