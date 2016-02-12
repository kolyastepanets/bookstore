class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @order_item = @order.add_book(params[:book_id], params[:quantity], params[:price])

    if @order_item.save
      redirect_to cart_path(@order)
    else
      redirect_to book_path(params[:book_id])
    end
  end

  def destroy
    @order = current_user.orders.in_progress.last
    order_item = @order.order_items.find(params[:id])
    order_item.destroy
    redirect_to cart_path(@order)
  end

  private

    def order_item_params
      params.require(:order_item).permit(:quantity, :book_id)
    end
end
