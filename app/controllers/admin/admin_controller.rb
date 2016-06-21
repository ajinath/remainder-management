class Admin::AdminController < ApplicationController
  before_action :set_admin_user, only: [:update_profile]
  
  def update_profile
    @admin.update(admin_param)
    redirect_to admin_path
  end
  
  private
    def set_admin_user
      @admin = Admin.find(params[:id])
    end
    def admin_param
      params.require(:admin).permit(:name, :email, :mobile_no)
    end
end
