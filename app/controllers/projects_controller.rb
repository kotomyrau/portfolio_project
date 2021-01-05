class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @user = current_user
    # @project_programme = @project.project_programmes
    # @programme = @project.programmes
    # @project_programme = ProjectProgramme.new

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
    @user = current_user
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
    @user = current_user
  end

  def update
    @user = current_user
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to project_path(@project), notice: 'Your project was successfully modified'
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:notice] = "Your project has been deleted"
      redirect_to users_path
    else
      redirect_to project_path(@project), notice: 'There was a problem, this project was not deleted!'
    end
  end
  private

  def project_params
    params.require(:project).permit(:title, :description, :project_date, :contributors, :link)
  end
end
