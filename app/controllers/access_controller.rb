class AccessController < ApplicationController
  layout 'application'

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def menu
  end

  def login
  end

  def attempt_login
    # check first if user_name is present, and password is present
    if params[:user_name].present? && params[:password].present?
      # use the first entry of student using the .where query
      found_user = Student.where(:user_name => params[:user_name]).first
      if found_user
        # authenticate this found user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    # if authenticated, save :student_id in session, make notice flash hash, and redirect to admin_path (User Home page)
    if authorized_user
      session[:student_id] = authorized_user.id
      flash[:notice] = "You are now logged in."
      redirect_to(admin_path)
    # else, display an error flash hash, and rerender the login page
    else
      flash.now[:notice] = "invalid username/password combination."
      render('login')
    end

  end

  def logout
    session[:student_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to(root_path)
  end
end
