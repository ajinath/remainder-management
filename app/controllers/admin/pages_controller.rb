class Admin::PagesController < AdminController
  def index
  	@users = User.order_by_created_at #pending_users
  end
  def profile
  	@admin = current_admin
  end
end