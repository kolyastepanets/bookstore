class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def address
    # byebug
    @order.building_billing_address
    @countries = Country.all
    # byebug
  end

  def update_address
    if @order.update_attributes(address_params)
      redirect_to checkouts_delivery_path
    else
      redirect_to checkouts_address_path
      flash[:alert] = @order.billing_address.errors.full_messages.join(", ")
    end
  end

  def delivery
    @deliveries = Delivery.all
  end

  def update_delivery
    begin @order.update_attributes(delivery_params)
      redirect_to checkouts_payment_path
    rescue
      redirect_to checkouts_delivery_path
      flash[:alert] = "Choose delivery"
    end
  end

  def payment
    @order.build_credit_card
  end

  def update_payment
    if @order.update_attributes(credit_card_params)
      redirect_to checkouts_confirm_path
    else
      redirect_to checkouts_payment_path
      flash[:alert] = @order.credit_card.errors.full_messages.join(", ")
    end
  end

  def confirm
    @order
    # byebug
  end

  def place_order
    if @order.billing_address.valid? && @order.delivery.valid? && @order.credit_card.valid?
      # byebug
      @order.process!
      create_order
      # @checkout.destroy
      # byebug
      redirect_to checkouts_completed_path
    else
      flash[:alert] = "unlucky guy"
    end
  end

  def completed
    @processing_order = order_in_process
    # byebug
  end

  private

    def address_params
      params.require(:order).permit(billing_address_attributes: [:first_name, :last_name, :street, :city, :zip, :phone, :type, :country_id])
    end

    def checkout_exist?
      redirect_to books_path if @order.nil?
    end

    def delivery_params
      params.require(:order).permit(:delivery_id)
    end

    def credit_card_params
      params.require(:order).permit(credit_card_attributes: [:number, :expiration_month, :expiration_year, :cvv])
    end

end
