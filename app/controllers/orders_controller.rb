class OrdersController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource

  def index
    @current_order = current_order
    @in_processing = current_user.orders.in_processing.order(created_at: :ASC)
    @in_delivery = current_user.orders.in_delivery.order(created_at: :ASC)
    @delivered = current_user.orders.delivered.order(created_at: :ASC)
  end

  def show
    @order = Order.find(params[:id])
  end

end
