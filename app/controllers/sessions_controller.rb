class SessionsController < ApplicationController
	def create
		user = User.where(:username => params[:login][:username]).first

		if user && user.authenticate(params[:login][:password])
			session[:user_id] = user.id
			flash[:notice] = "Hi, #{user.username}!"

			redirect_to root_url
		else
			flash[:notice] = "Incorrect login."
			render :new
		end
	end
end