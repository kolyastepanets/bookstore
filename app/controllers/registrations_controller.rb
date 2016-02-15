class RegistrationsController < Devise::RegistrationsController
  def edit
    building_shipping_address
    building_billing_address
    @countries = Country.all
    super
  end

  def update_email
    if current_user.update(email_params)
      flash[:notice] = "Your email has been updated successefully"
      redirect_to edit_user_registration_path
    else
      flash[:alert] = current_user.errors.full_messages.join(", ")
      redirect_to edit_user_registration_path
    end
  end

  def update_password
    if current_user.update_with_password(password_params)
      sign_in current_user, :bypass => true
      flash[:notice] = "Your password has been updated successfully"
      redirect_to edit_user_registration_path
    else
      flash[:alert] = current_user.errors.full_messages.join(", ")
      redirect_to edit_user_registration_path
    end
  end

  def update_billing_address
    # building_billing_address
    if current_user.update(billing_params)
      flash[:notice] = "Your billing address has been updated successfully"
      redirect_to edit_user_registration_path
    else
      flash[:alert] = current_user.billing_address.errors.full_messages.join(", ")
      redirect_to edit_user_registration_path
    end
  end

  def update_shipping_address
    if current_user.update(shipping_params)
      # byebug
      Rails.logger.info(current_user.shipping_address.errors.inspect)
      flash[:notice] = "Your shipping address has been updated successfully"
      redirect_to edit_user_registration_path
    else
      byebug
      Rails.logger.info(current_user.shipping_address.errors.inspect)
      flash[:alert] = current_user.shipping_address.errors.full_messages.join(", ")
      redirect_to edit_user_registration_path
    end
  end

  private

    def building_shipping_address
      current_user.build_shipping_address unless current_user.shipping_address
    end

    def building_billing_address
      current_user.build_billing_address unless current_user.billing_address
    end

    def email_params
      params.require(:user).permit(:email)
    end

    def password_params
      params.require(:user).permit(:current_password, :password)
    end

    def billing_params
      params.require(:user).permit(billing_address_attributes: address_params)
    end

    def shipping_params
      params.require(:user).permit(shipping_address_attributes: address_params)
    end

    def address_params
      [:first_name, :last_name, :street, :city, :zip, :phone, :type, :country_id]
    end
end
