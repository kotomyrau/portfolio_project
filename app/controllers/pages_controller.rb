class PagesController < ApplicationController
  def home
    @projects = Project.all
    @preview_projects = @projects.last(3)
    @programmes = @preview_projects.programmes
    @project = @projects[1]
  end

  def about
    @programmes = Programme.all

  end
end
