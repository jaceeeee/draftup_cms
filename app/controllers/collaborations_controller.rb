class CollaborationsController < ApplicationController

  def index
    @collaborations = Collaboration.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  def find_student
    if session[:student_id]
      @student = Student.find(session[:student_id])
    else
      redirect_to_login
    end
  end
end
