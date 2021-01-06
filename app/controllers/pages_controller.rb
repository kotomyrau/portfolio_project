class PagesController < ApplicationController
  def home
    @projects = Project.last(2)
  end

  def about
    @programmes = Programme.all

  end
end
