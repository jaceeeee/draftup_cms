# controller for admin management of students
# ignore
# some parts will go away after this current version of app
class StudentsController < ApplicationController
  layout 'app_theme'
# displays all students, in ascending order according to :last_name
  def index
    @students = Student.sorted
  end

# finds the student using current id parameter
  def show
    @student = Student.find(params[:id])
  end

# instantiates new student
  def new
    @student = Student.new
  end

# creates new student and saves
# if save fails, render 'new' template again
  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to(root_path)
    else
      render('new')
    end
  end

# find student and store as instance variable
  def edit
    @student = Student.find(params[:id])
  end

# find student again and update attributes
# if update_attributes fails, render edit
  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      redirect_to(student_path(@student))
    else
      render('edit')
    end
  end

# find student and store as instance variable
  def delete
    @student = Student.find(params[:id])
  end

# find student again and destroy from records
# redirect to students_path (index template)
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to(students_path)
  end

# allow a student to be saved by permitting all the following attributes
  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :password, :email, :student_number, :user_name, :profile_pic)
  end

end
