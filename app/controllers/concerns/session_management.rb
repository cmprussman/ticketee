module SessionManagement
	extend ActiveSupport::Concern

	def require_login
		if current_user.nil?
			flash[:notice] = "Please login."
			redirect_to login_url
		end
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
end