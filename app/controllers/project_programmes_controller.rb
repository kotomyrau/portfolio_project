class ProjectProgrammesController < ApplicationController
  # create a new connection
  def new
    @user = current_user
    @project_programme = ProjectProgramme.new
    @projects = Project.all
    @project = Project.find(params[:project_id])
    @programmes = Programme.all
  end

  def create
    @user = current_user
    @projects = Project.all
    # @project = Project.find(params[:id])
    @programmes = Programme.all
    @project_programme = ProjectProgramme.new(project_programme_params)
    if @project_programme.save
      redirect_to projects_path
    else
      render :new
    end
  end

  private

  def project_programme_params
    params.require(:project_programme).permit(:project_id, :programme_id)
  end
end
