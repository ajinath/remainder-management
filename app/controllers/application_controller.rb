class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
  	kclass = resource.class.to_s
  	case kclass
  		when "Admin"
  			session['admin_return_to'] = admin_path
  		when "User"
  			session['user_return_to'] = groups_path
  	end
  end
end
