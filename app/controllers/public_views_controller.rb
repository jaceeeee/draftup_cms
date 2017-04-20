class PublicViewsController < ApplicationController
  layout 'application'

# finds current logged in user, otherwise, @student is nil
  def index
    @student = session[:student_id] != nil ? Student.find(session[:student_id]) : nil
  end
end
