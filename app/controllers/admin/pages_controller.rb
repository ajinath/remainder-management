class Admin::PagesController < AdminController
  def index
  	@users = User.order_by_created_at #pending_users
  end
end