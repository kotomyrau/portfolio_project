class PagesController < ApplicationController
  def home
    @preview_projects = Project.last(3)
  end

  def about
    @programmes = Programme.order('name ASC')
  end
end
