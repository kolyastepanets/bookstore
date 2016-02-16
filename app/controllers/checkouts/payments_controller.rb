class Checkouts::PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_order

  def edit
    authorize! :edit, @order
    @order.building_credit_card
  end

  def update
    authorize! :update, @order
    if @order.update_attributes(credit_card_params)
      redirect_to checkouts_confirm_path(@order)
    else
      render :edit
    end
  end

  private

    def credit_card_params
      params.require(:order).permit(credit_card_attributes: [:number, :expiration_month, :expiration_year, :cvv])
    end

    def check_order
      redirect_to books_path if @order.order_items.empty?
    end

end
