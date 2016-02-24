class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    authorize! :show, Order
  end

  def update
    authorize! :update, Order
    @order.order_items.update(params[:items].keys, params[:items].values)
    # binding.pry
    redirect_to cart_path
  end

  def destroy
    authorize! :destroy, Order
    @order.destroy
    redirect_to books_path
  end

end
