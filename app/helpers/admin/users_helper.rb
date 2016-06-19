module Admin::UsersHelper
	def status_class status
		case status
		when "blocked"
			"text-danger"
		when "approved"
			"text-success"
		end
	end
end
