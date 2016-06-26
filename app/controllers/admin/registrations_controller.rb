class Admin::RegistrationsController <  Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:admin).permit(:name, :email, :mobile_no, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:admin).permit(:name, :email, :mobile_no)
  end
end
