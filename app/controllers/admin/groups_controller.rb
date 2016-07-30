class Admin::GroupsController < AdminController
  before_action :set_group, only: [:reject, :approve]

  def index
    @groups = Group.all
  end

  def reject
    @group.update(status: false)
    @groups = Group.all
  end

  def approve
    @group.update(status: true)
    @groups = Group.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end
end
