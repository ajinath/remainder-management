class Admin::UsersController < AdminController
  before_action :set_admin_user, only: [:show, :destroy]
  def index
    @users = User.all
  end

  def show
    @groups = @user.groups
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_admin_user
      @user = User.find(params[:id])
    end
end
