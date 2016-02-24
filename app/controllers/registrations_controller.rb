  class RegistrationsController < Devise::RegistrationsController
  before_action :load_countries
  before_action :set_user

  def edit
    authorize! :edit, User
    @user.build_shipping_address unless @user.shipping_address
    @user.build_billing_address unless @user.billing_address
    super
  end

  def update
    authorize! :update, User
    params_to_update = detect_form

    if @user.update_attributes(params_to_update)
      flash[:notice] = "Your settings has been updated successefully"
      redirect_to edit_user_registration_path
    else
      render :edit
    end
  end

  def update_password
    authorize! :update_password, User
    if @user.update_with_password(password_params)
      # binding.pry
      flash[:notice] = "Your password has been updated successefully"
      sign_in @user, :bypass => true
      redirect_to edit_user_registration_path
    else
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

    def load_countries
      @countries = Country.all
    end

    def set_user
      @user = current_user
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
