class RegistrationsController < Devise::RegistrationsController
  def edit
    building_shipping_address
    building_billing_address
    @countries = Country.all
    super
  end

  def update
    # binding.pry
    params_to_update = detect_form

    if current_user.update_attributes(params_to_update)
      flash[:notice] = "Your parameter has been updated successefully"
      redirect_to edit_user_registration_path
    else
      @countries = Country.all
      render :edit
    end
  end

  def update_password
    if current_user.update_with_password(password_params)
      flash[:notice] = "Your password has been updated successefully"
      sign_in current_user, :bypass => true
      redirect_to edit_user_registration_path
    else
      @countries = Country.all
      render :edit
    end
  end

  private

    def detect_form
      if params.include?(:email_update)
        email_params
      elsif params.include?(:billing_address_update)
        billing_params
      elsif params.include?(:shipping_address_update)
        shipping_params
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
