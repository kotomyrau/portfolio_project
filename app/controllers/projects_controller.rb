class ProjectsController < ApplicationController

  def new
    @project = Project.new
    @user = current_user

  end

  def create
    @user = current_user
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project), notice: 'Your project has been created!'
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :project_date, :contributors, :link)
  end
end
