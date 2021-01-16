class PagesController < ApplicationController
  def home
    @projects = Project.all
    @preview_projects = @projects.last(3)
    @project = @projects[1]
  end

  def about
    # @programmes = Programme.all
    @programmes = Programme.order('name ASC')
  end
end
