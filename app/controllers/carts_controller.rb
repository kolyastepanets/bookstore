class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order

  def show
  end

  def update
    @order = current_user.orders.in_progress.last
    @order.order_items.update(params[:items].keys, params[:items].values)
    redirect_to cart_path(@order)
  end

  def destroy
    @order.destroy
    @checkout.destroy unless @checkout.nil?
    redirect_to books_path
  end

  private

    def set_order
      if current_user.orders.in_progress.last
        @order = current_user.orders.in_progress.last
      end
    end

    def set_checkout
      @checkout ||= Checkout.last
    end
end
