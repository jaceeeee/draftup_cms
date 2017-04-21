class CollaborationsController < ApplicationController
  layout 'app_theme'
# still empty; needs tweaking
  before_action :find_student

  def index
    @collaborations = @student.collaborations.all
  end

  def show
    @collaboration = @student.collaborations.find(params[:id])
  end

  def new
    @collaboration = Collaboration.new
  end

  def create
    @collaboration = Collaboration.new(collaboration_params)
    if @student.collaborations << @collaboration
      redirect_to(collaborations_path)
    else
      render 'new'
    end
  end

  def edit
    @collaboration = Collaboration.find(params[:id])
  end

  def update
    @collaboration = Collaboration.find(params[:id])
    if @collaboration.update_attributes(collaboration_params)
      redirect_to(collaboration_path(@collaboration))
    else
      render 'edit'
    end
  end

  def delete
    @collaboration = Collaboration.find(params[:id])
  end

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
