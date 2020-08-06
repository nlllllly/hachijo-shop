class SearchesController < ApplicationController
    skip_before_action :authenticate_user!, only:[:search]
    skip_before_action :authenticate_admin!, only:[:search]

    def search
        word = params[:word]

        if word.present?
            @products = Product.page(params[:page]).per(30).where('name LIKE ?', "%#{word}%")
        else
            @products = Product.page(params[:page]).per(30).none
        end
    end
end
