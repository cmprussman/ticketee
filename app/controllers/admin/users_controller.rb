class Admin::UsersController < Admin::BaseController

	def index
		@users = User.order(:email)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash.notice = "User created."
			redirect_to admin_users_path
		else
			flash.now.notice = "Error creating user."
			render :new
		end
	end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end
end