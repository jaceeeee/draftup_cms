class PagesController < ApplicationController
  layout 'application'
  
  def about
    @title = "About us"
    @content = "This is the about page."
  end
end
