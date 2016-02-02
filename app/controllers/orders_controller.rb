class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def destroy
    @order.destroy
    respond_to do |format|

      format.html { redirect_to books_path,
        notice: 'Your cart is empty' }
    end
  end
end
