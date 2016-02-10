class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_order, except: :completed

  def address
    @order.build_both_addresses
    @countries = Country.all
    # byebug
  end

  def update_address
    if @order.updating_both_addresses(addresses_params, params[:coping_billing_address])
      redirect_to checkouts_delivery_path
    else
      redirect_to checkouts_address_path
      Rails.logger.info(@order.billing_address.errors.inspect)
      flash[:alert] = @order.billing_address.errors.full_messages.join(", ")
      flash[:alert] = @order.shipping_address.errors.full_messages.join(", ")
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
    @order.building_credit_card
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
    check_confirm
    @order
  end

  def place_order
    if @order.billing_address.valid? && @order.delivery.valid? && @order.credit_card.valid?
      @order.process!
      create_order
      redirect_to checkouts_completed_path
    else
      flash[:alert] = "unlucky guy"
    end
  end

  def completed
    @processing_order = order_in_process
  end


  private

    def addresses_params
      params.require(:order).permit(
          billing_address_attributes: address_params,
          shipping_address_attributes: address_params)
    end

    def address_params
      [:first_name, :last_name, :street, :city, :zip, :phone, :type, :country_id]
    end

    def check_order
      redirect_to books_path if @order.order_items.empty?
    end

    def check_confirm
      if @order.billing_address.nil? || @order.shipping_address.nil?
        redirect_to checkouts_address_path
      elsif @order.credit_card.nil?
        redirect_to checkouts_payment_path
      elsif @order.delivery.nil?
        redirect_to checkouts_delivery_path
      end
    end

    def delivery_params
      params.require(:order).permit(:delivery_id)
    end

    def credit_card_params
      params.require(:order).permit(credit_card_attributes: [:number, :expiration_month, :expiration_year, :cvv])
    end

end
