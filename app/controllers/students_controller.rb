class StudentsController < ApplicationController

  before_action :confirm_logged_in

  def index
    @students = Student.sorted
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.password = "*****"
    # defaulted, for now
    if @student.save
      redirect_to(students_path)
    else
      render('new')
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      redirect_to(student_path(@student))
    else
      render('new')
    end
  end

  def delete
    @student = Student.find(params[:id])
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to(students_path)

  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :password, :email, :student_number)
  end

end
