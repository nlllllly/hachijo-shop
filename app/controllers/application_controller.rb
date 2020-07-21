class ApplicationController < ActionController::Base
  # UserもAdminもここで一度、ログインができていないと全ての操作ができないように制御
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # CSRF対策用　<%= csrf_meta_tags %> で埋め込める
  protect_from_forgery with: :exception
  
  def after_sign_up_path_for(resource)
    root_path
  end
  # ログイン後のリダイレクト先
  # def after_sign_in_path_for(resource)
  #     user_path(resource)
  # end
  # ログアウト後のリダイレクト先
  # def after_sign_out_path_for(resource)
  #     root_path
  # end 

    
    helper_method :current_cart

    def current_cart
      if session[:cart_id]
        @cart = Cart.find(session[:cart_id])
      else
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
    end


    protected
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name_roman, :first_name_roman, :last_name, :first_name, :sex, :birth_date])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :last_name_roman, :first_name_roman, :last_name, :first_name, :sex, :birth_date])
        devise_parameter_sanitizer.permit(:accout_update, keys: [:email, :last_name_roman, :first_name_roman, :last_name, :first_name, :sex, :birth_date])
      end


end
