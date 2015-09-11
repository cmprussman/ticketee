class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
      def authorize_admin!
      require_login

      unless current_user.admin?
        flash[:notice] = "Admin account required."
        redirect_to root_path
      end
    end
end
