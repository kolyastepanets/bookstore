class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from Exception, :with => :error_render_method

  def error_render_method
    redirect_to main_app.books_path
  end

  before_action :set_order
  helper_method :current_order
  before_filter :update_sanitized_params, if: :devise_controller?

  after_filter :store_location

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:firstname, :lastname, :email, :password)}
  end

  def set_order
    if current_user
      if order_in_session
        @order.update_attributes(user_id: current_user.id)
      else
        @order = current_order
      end
    else
      order_in_session
    end
  end

  def order_in_session
    begin
      @order = Order.find(session[:order_id])
    rescue
      @order = nil
    end
  end

  def current_order
    current_user.orders.in_progress.last if current_user
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

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to books_path, alert: exception.message
  end

  private

    def after_sign_in_path_for(resource)
      session[:previous_url] || root_path
    end

    def after_sign_out_path_for(resource_or_scope)
      request.referrer
    end

end
