class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :checkout_exist?

  def address
    # byebug
    current_checkout.building_billing_address
    # byebug
  end

  def update_address
    if current_checkout.update_attributes(address_params)
      redirect_to checkouts_delivery_path
    else
      redirect_to checkouts_address_path
      flash[:alert] = current_checkout.billing_address.errors.full_messages.join(", ")
    end
  end

  def delivery
    current_checkout
  end

  private

    def address_params
      params.require(:order).permit(billing_address_attributes: [:first_name, :last_name, :street, :city, :zip, :phone, :type, :country_id])
    end

    def checkout_exist?
      redirect_to books_path if @order.nil?
    end

end
