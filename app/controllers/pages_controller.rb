class PagesController < ApplicationController
  layout false
  def about
    @title = "About us"
    @content = "This is the about page."    
  end
end
