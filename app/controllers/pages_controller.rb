class PagesController < ApplicationController
  layout 'public'

  def about
    @title = "About us"
    @content = "This is the about page."
  end
end
