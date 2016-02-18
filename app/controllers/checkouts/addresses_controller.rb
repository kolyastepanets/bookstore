class Checkouts::AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_countries
  before_action :check_order

  def edit
    # binding.pry
    authorize! :edit, @order
    @order.build_both_addresses
    # byebug
  end

  def update
    authorize! :update, @order
    # binding.pry

    new_params = {}
    new_params[:billing_address_attributes] = billing_address_attributes_params[:billing_address_attributes]

    new_params[:shipping_address_attributes] = calculate_shipping_attrs

    if @order.update_attributes(new_params)
      redirect_to edit_checkouts_delivery_path
    else
      render :edit
    end

  end

  private

    def load_countries
      @countries = Country.all
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

    def check_order
      redirect_to books_path if @order.order_items.empty?
    end

end
