class CollaborationsController < ApplicationController
  layout 'app_theme'
  before_action :find_student
  # finds a student at each method call

  # finds all collaborations belonging to a student
  def index
    @collaborations = @student.collaborations.all
  end

  # finds a specific collaboration and renders the show template
  def show
    @collaboration = @student.collaborations.find(params[:id])
  end

  # initializes an empty collaboration
  def new
    @collaboration = Collaboration.new
  end

  # creates and saves the student with current parameters
  def create
    @collaboration = Collaboration.new(collaboration_params)
    if @student.collaborations << @collaboration
      # redirects to index
      redirect_to(collaborations_path)
    else
      # rerenders the form
      render 'new'
    end
  end

  # shows the edit form template filled in with params of
  # selected collaboration
  def edit
    @collaboration = Collaboration.find(params[:id])
  end

  # updates the collaboration
  def update
    @collaboration = Collaboration.find(params[:id])
    if @collaboration.update_attributes(collaboration_params)
      # redirects to 'show' template
      redirect_to(collaboration_path(@collaboration))
    else
      # rerenders 'edit' template
      render 'edit'
    end
  end

  # renders 'delete' template for selected thesis
  def delete
    @collaboration = Collaboration.find(params[:id])
  end

  # destroys selected thesis object from the database
  def destroy
    @collaboration = Collaboration.find(params[:id])
    @collaboration.destroy
    redirect_to collaborations_path
  end

  private

  def find_student
    if session[:student_id]
      @student = Student.find(session[:student_id])
    else
      redirect_to_login
    end
  end

  def collaboration_params
    params.require(:collaboration).permit(:team_name, :purpose, :member_limit)
  end
end
