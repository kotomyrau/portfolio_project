class ProjectsController < ApplicationController
  def index
    @projects = Project.order('start_date DESC')
  end

  def show
    @project = Project.find(params[:id])
    @project_image = @project.project_image
    @project_images = @project.project_images
  end
end
