class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def confirm_logged_in
    unless session[:student_id]
      flash[:notice] = "Please log in."
      redirect_to(access_login_path)
      # redirect action prevents action from logging    
    end

  end
end
