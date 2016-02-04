class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def update
    @order = current_user.orders.in_progress.last
    @order.order_items.update(params[:items].keys, params[:items].values)
    redirect_to cart_path(@order)
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to books_path,
        notice: 'Your cart is empty' }
    end
  end
end
