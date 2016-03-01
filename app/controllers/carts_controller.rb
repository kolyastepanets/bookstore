class CartsController < ApplicationController

  def show
    authorize! :show, Order
  end

  def update
    authorize! :update, Order
    updating_quantity
    updating_coupon
    redirect_to cart_path
  end

  def destroy
    authorize! :destroy, Order
    @order.destroy
    redirect_to books_path
  end

  private

    def updating_quantity
      @order.order_items.update(params[:items].keys, params[:items].values)
    end

    def updating_coupon
      unless params[:order][:coupon_attributes][:name] == ""
        coupon = Coupon.where("name = ?", params[:order][:coupon_attributes][:name])
        coupon = coupon.first
        if coupon.nil?
          flash[:alert] = "Invalid coupon"
        elsif coupon.present?
          @order.update_attributes(coupon_id: coupon.id)
          flash[:notice] = "You have successfully used coupon"
        end
      end
    end


end
