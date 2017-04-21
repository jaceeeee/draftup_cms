class AccessController < ApplicationController
  layout 'app_theme'

  # confirm logged in before accessing menu
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  # render menu only capturing session' username log

  def menu
    @student_id = session[:student_id]
    @student = Student.find(@student_id)
  end

  # render login form only, no further actions

  def login
  end

  # check first if user_name is present, and password is present,
  # use the first entry of student using the .where query
  # then authenticate this found user

  def attempt_login
    if params[:user_name].present? && params[:password].present?
      found_user = Student.where(:user_name => params[:user_name]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

  # if authenticated, save :student_id in session, make notice flash hash, and redirect to admin_path (User Home page)
  # else, display an error flash hash, and rerender the login page

    if authorized_user
      session[:student_id] = authorized_user.id
      flash[:notice] = "You are now logged in."
      redirect_to(admin_path)
    else
      flash.now[:notice] = "invalid username/password combination."
      render('login')
    end
  end

# set sessions to nil
# flash a notice
# and redirect to public page

  def logout
    session[:student_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to(root_path)
  end
end
