class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_order

  def create
    authorize! :create, OrderItem
    if current_order.add_book(params[:book_id], params[:quantity], params[:price])
      redirect_to cart_path(current_order)
    else
      redirect_to book_path(params[:book_id])
    end
  end

  def destroy
    authorize! :destroy, OrderItem
    order_item = current_order.order_items.find(params[:id])
    order_item.destroy
    redirect_to cart_path(current_order)
  end

  private

    def order_item_params
      params.require(:order_item).permit(:quantity, :book_id)
    end

    def set_current_order
      current_order ? current_order : create_order
    end

end
