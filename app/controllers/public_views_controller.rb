class PublicViewsController < ApplicationController
  layout 'application'

  def index
    @student = session[:student_id] != nil ? Student.find(session[:student_id]) : nil
  end
end
