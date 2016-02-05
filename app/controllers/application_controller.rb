class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_order

  before_filter :update_sanitized_params, if: :devise_controller?

  after_filter :store_location

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:firstname, :lastname, :email, :password)}
  end

  def set_order
    if current_user
      if current_user.orders.in_progress.last
        @order = current_user.orders.in_progress.last
      else
        @order = current_user.orders.create
      end
    end
  end

  def store_location
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

end
