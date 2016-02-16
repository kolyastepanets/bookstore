class Checkouts::DeliveriesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_deliveries, only: :edit
  before_action :check_order

  def edit
    authorize! :edit, @order
  end

  def update
    authorize! :update, @order
    begin @order.update_attributes(delivery_params)
      redirect_to edit_checkouts_payment_path
    rescue
      @deliveries = Delivery.all
      flash[:alert] = "Please, choose delivery."
      render :edit
    end
  end

  private

    def load_deliveries
      @deliveries = Delivery.all
    end

    def delivery_params
      params.require(:order).permit(:delivery_id)
    end

    def check_order
      redirect_to books_path if @order.order_items.empty?
    end

end
