module ApplicationHelper
	def logout_helper
		if current_user
    		link_to "Logout",destroy_user_session_path,method: :delete
		end
	end
end
