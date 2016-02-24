class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_order

  def create
    authorize! :create, OrderItem
    if current_order.add_book(params[:book_id], params[:quantity], params[:price])
      redirect_to cart_path
    else
      redirect_to book_path(params[:book_id])
    end
  end

  def destroy
    authorize! :destroy, OrderItem
    order_item = current_order.order_items.find(params[:id])
    order_item.destroy
    if current_order.order_items.empty?
      current_order.destroy
      redirect_to books_path
    else
      redirect_to cart_path
    end
  end

  private

    def set_current_order
      current_order ? current_order : create_order
    end

    def create_order
      @order = current_user.orders.create
    end

end
