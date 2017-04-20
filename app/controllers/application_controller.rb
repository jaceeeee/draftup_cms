class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  # this method inherited across all controllers on the app
  def confirm_logged_in
    unless session[:student_id]
      flash[:notice] = "Please log in."
      redirect_to(access_login_path)
      # redirect action prevents action from logging, so be careful
    end

  end
end
