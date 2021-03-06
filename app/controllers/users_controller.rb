class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = "Welcome, #{@user.username}!"
			redirect_to projects_path
		else
			flash[:notice] = "Error with your input."
			render :new
		end
	end

	private

		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end
end