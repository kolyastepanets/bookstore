module CurrentOrder
  extend ActiveSupport::Concern

  private

    def set_order
      @order = Order.find(params[:order_id])
    rescue ActiveRecord::RecordNotFound
      @order = Order.create(user: current_user)
      session[:order_id] = @order.id
    end

end