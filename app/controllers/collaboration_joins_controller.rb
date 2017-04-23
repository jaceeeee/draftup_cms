# used for linking a student to other students through Collaborations
class CollaborationJoinsController < ApplicationController
  layout 'app_theme'
  before_action :find_student
  # @student is instantiated at every method call

# displays all collaborations regardless of who is in it
  def index
    @collaborations = Collaboration.all
  end

# finds the collaboration corresponding to id
  def edit
    @collaboration = Collaboration.find(params[:id])
  end

# updates the collaboration by adding it to the logged-in student
  def update_collaboration
    @collaboration = Collaboration.find(params[:id])
    if @student.collaborations << @collaboration
      # redirects to home page
      redirect_to admin_path
    else
      # rerenders the prompt page
      render 'edit'
    end
  end
end
