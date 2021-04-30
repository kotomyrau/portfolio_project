class ProjectsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  def index
    @projects = Project.order('project_date DESC')
    @programmes = Programme.order('name ASC')
  end

  def new
    @project = Project.new
    @user = current_user
    @programmes = Programme.all

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
    @project_programme = ProjectProgramme.where(project_id: params[:id], programme_id: params[:id])
    @project_date = @project.project_date.strftime("%b %Y")
    @project_link = @project.link
    @project_demo = @project.demoLink
    @project_client = @project.client
    @project_category = @project.category
    @project_image = @project.project_image
    @project_images = @project.project_images
  end

  def edit
    @project = Project.find(params[:id])
    @user = current_user
    @project_programme = ProjectProgramme.where(project_id: @project.id)
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

  def require_login
    unless user_signed_in?
      flash[:error] = "This section requires a login"
      redirect_to root_path
    end
  end

  def project_params
    params.require(:project).permit(:title, :description, :project_date, :client, :category, :link, :demoLink, :project_image, project_images: [])
  end
end
