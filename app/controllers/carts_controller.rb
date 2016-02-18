class CartsController < ApplicationController
  before_action :authenticate_user!

  # load_and_authorize_resource

  def show
    authorize! :show, @order
  end

  def update
    authorize! :update, @order
    @order = current_user.orders.in_progress.last
    @order.order_items.update(params[:items].keys, params[:items].values)
    redirect_to cart_path(@order)

  end

  def destroy
    authorize! :destroy, @order
    @order.destroy
    redirect_to books_path
  end

end
