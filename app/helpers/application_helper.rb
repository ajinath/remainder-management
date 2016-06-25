module ApplicationHelper
  def menu
  	current_admin.present? ? "layouts/admin_menu" : "layouts/user_menu"
  end

  def edit_icon
   raw("<span class ='badge icon-pad info-bg'><i class='fa fa-pencil fa-1x'></i>&nbsp; Edit</span>").html_safe 
  end
  def delete_icon
  	raw("<span class ='badge icon-pad danger-bg'><i class='fa fa-trash'></i> &nbsp; Delete </span>").html_safe
  end
  def show_icon
  	raw("<span class ='badge icon-pad'><i class='fa fa-eye'></i> &nbsp; View </span>").html_safe
  end
end
