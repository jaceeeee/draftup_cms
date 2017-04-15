class ThesesController < ApplicationController

# set find student to a before action to access sessions for student
  before_action :find_student

# accessing all theses..
  def index
    @theses = @student.theses.all
  end

# defining a new thesis..
  def new
    @thesis = Thesis.new
  end

# creating a new thesis and appending student to thesis
# and thesis to student
  def create
    @thesis = Thesis.new(thesis_params)

# this adds the thesis created to the logged-in user
    @student.theses << @thesis

    if @thesis.save
      redirect_to(theses_path, notice: "The thesis #{@thesis.title} has been uploaded.")
    else
      render "new"
    end
  end

  def edit
    @thesis = Thesis.find(params[:id])
  end

  def update
    @thesis = Thesis.find(params[:id])
    if @thesis.update_attributes(thesis_params)
      redirect_to(theses_path)
    else
      render('edit')
    end
  end
# destroy matching thesis
  def destroy
    @thesis = Thesis.find(params[:id])
    @thesis.destroy
    redirect_to(theses_path, notice: "The thesis #{@thesis.title} has been deleted.")
  end

  private
  def thesis_params
    params.require(:thesis).permit(:title, :attachment)
  end

  def redirect_to_login
    unless session[:student_id]
      redirect_to(access_login_path)
    end
  end

  def find_student
    if session[:student_id]
      @student = Student.find(session[:student_id])
    else
      redirect_to_login
    end
  end

end
