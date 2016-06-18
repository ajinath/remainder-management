class Admin::GroupsController < AdminController
  before_action :set_group, only: [:show, :destroy, :remainders]

  def index
    @groups = Group.all
  end

  def show
    @user = @group.user
    @remainders = @group.remainders
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remainders
    @remainders = @group.remainders
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through. members_attributes
    def group_params
      params.require(:group).permit(:name, :contact, :status, :user_id, members_attributes: [:id, :name, :contact, :group_id, :_destroy])
    end
end
