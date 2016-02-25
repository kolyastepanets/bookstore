class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    authorize! :show, Order
  end

  def update
    authorize! :update, Order
    @order.order_items.update(params[:items].keys, params[:items].values)

    unless params[:order][:coupon_attributes][:name] == ""
      if !@order.coupon.nil?
        flash[:alert] = "You have already used coupon for this cart"
      else
        coupon = Coupon.where("name = ?", params[:order][:coupon_attributes][:name])
        coupon = coupon.first
        if coupon.nil?
          flash[:alert] = "Invalid coupon"
        else
          @order.update_attributes(coupon_id: coupon.id)
          flash[:notice] = "You have successfully used coupon"
        end
      end
    end
    redirect_to cart_path
  end

  def destroy
    authorize! :destroy, Order
    @order.destroy
    redirect_to books_path
  end

end
