class Checkouts::ConfirmsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_order, except: :completed

  def show
    authorize! :show, @order
    check_confirm
  end

  def update
    authorize! :update, @order
    if @order.billing_address.valid? && @order.delivery.valid? && @order.credit_card.valid?
      @order.process!
      redirect_to completed_checkouts_confirm_path
    else
      render :show
    end
  end

  def completed
    @processing_order = order_in_process
  end

  private

    def check_confirm
      if @order.billing_address.nil? || @order.shipping_address.nil?
        redirect_to edit_checkouts_address
      elsif @order.credit_card.nil?
        redirect_to edit_checkouts_payment_path
      elsif @order.delivery.nil?
        redirect_to edit_checkouts_delivery_path
      end
    end

    def check_order
      redirect_to books_path if @order.order_items.empty?
    end

end
