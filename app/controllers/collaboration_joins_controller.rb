class CollaborationJoinsController < ApplicationController
  layout 'app_theme'
  before_action :find_student

  def index
    @collaborations = Collaboration.all
  end

  def edit
    @collaboration = Collaboration.find(params[:id])
  end

  def update_collaboration
    @collaboration = Collaboration.find(params[:id])
    if @student.collaborations << @collaboration
      redirect_to admin_path
    else
      render 'edit'
    end
  end
end
