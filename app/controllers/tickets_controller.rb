class TicketsController < ApplicationController
	before_action :set_project
	before_action :set_ticket, only: [:show, :edit, :update, :destroy]
	before_action :require_login, except: [:show, :index]

	helper_method :require_login
	helper_method :current_user

	def new
		@ticket = @project.tickets.build
	end

	def create
		@ticket = @project.tickets.build(ticket_params)
		@ticket.user = current_user

		if @ticket.save
			flash[:notice] = "Ticket created."
			redirect_to [@project, @ticket]
		else
			flash[:notice] = "Error creating ticket."
			render :new
		end
	end

	def edit
	end

	def update
		if @ticket.update(ticket_params)
			flash[:notice] = "Ticket updated."

			redirect_to [@project, @ticket]
		else
			flash[:notice] = "Error updating ticket."

			render :edit
		end
	end

	def destroy
		@ticket.destroy
		flash[:notice] = "Ticket deleted."

		redirect_to @project
	end

	private
		def ticket_params
			params.require(:ticket).permit(:title, :description)
		end

		def set_project
			@project = Project.find(params[:project_id])
		end

		def set_ticket
			@ticket = @project.tickets.find(params[:id])
			@ticket.user = current_user
		end

		def require_login
			if current_user.nil?
				flash[:error] = "Please login."
				redirect_to login_url
			end
		end

		def current_user
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
		end
end