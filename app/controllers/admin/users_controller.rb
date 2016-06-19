class Admin::UsersController < AdminController
  before_action :set_admin_user, only: [:show, :destroy, :approve, :reject]
  def index
    @users = User.order_by_created_at
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

  def approve
    @user.update(status: 'approved')
    @users = User.order_by_created_at
  end

  def reject
    @user.update(status: 'blocked')
    @users = User.order_by_created_at
  end

  private
    def set_admin_user
      @user = User.find(params[:id])
    end
end
