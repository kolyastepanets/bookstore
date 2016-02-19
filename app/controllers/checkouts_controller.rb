class CheckoutsController < ApplicationController
  skip_before_filter :setup_wizard, only: :completed
  before_action :check_order, only: [:show, :update]

  include Wicked::Wizard

  steps :address, :delivery, :payment, :confirm

  before_action :authenticate_user!

  def show
    case step
      when :address
        @order.build_both_addresses
        @countries = Country.all

      when :delivery
        @deliveries = Delivery.all
        unless @order.billing_address && @order.shipping_address
          jump_to(:address)
        end

      when :payment
        unless @order.delivery
          jump_to(:delivery)
        end
        @order.building_credit_card

      when :confirm
        unless @order.credit_card
          jump_to(:payment)
          flash[:alert] = "Please, fill in form"
        end
        @order

    end
    render_wizard
    # byebug
  end

  def update
    case step
      when :address
        @countries = Country.all
        new_params = {}
        new_params[:billing_address_attributes] = billing_address_attributes_params[:billing_address_attributes]
        new_params[:shipping_address_attributes] = calculate_shipping_attrs

        @order.update_attributes(new_params)

      when :delivery
        begin
          @order.update_attributes(delivery_params)
        rescue
          flash[:alert] = "Choose delivery"
          jump_to(:delivery)
        end

      when :payment
        @order.update_attributes(credit_card_params)

      when :confirm
        @order.process!
    end

    render_wizard @order
  end

  def finish_wizard_path
    completed_checkout_path
  end

  def completed
    # binding.pry
    @processing_order = order_in_process
  end

  private

    def check_order
      redirect_to completed_checkout_path if wizard_path(:wicked_finish) && @order.nil?
    end

    def delivery_params
      params.require(:order).permit(:delivery_id)
    end

    def credit_card_params
      params.require(:order).permit(credit_card_attributes: [:number, :expiration_month, :expiration_year, :cvv])
    end

    def calculate_shipping_attrs
      if params[:coping_billing_address]
        billing_address_attributes_params[:billing_address_attributes]
      else
        shipping_address_attributes_params[:shipping_address_attributes]
      end
    end

    def billing_address_attributes_params
      params.require(:order).permit(billing_address_attributes: address_params)
    end

    def shipping_address_attributes_params
      params.require(:order).permit(shipping_address_attributes: address_params)
    end

    def address_params
      [:first_name, :last_name, :street, :city, :zip, :phone, :type, :country_id]
    end

end
