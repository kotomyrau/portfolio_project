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
    @project_programme = ProjectProgramme.new(project_programme_params)
    if @project_programme.save
      redirect_to projects_path
    else
      render :new
    end
  end

    def destroy
      @user = current_user
      @project_programme = ProjectProgramme.find(params[:id])
      if @project_programme.destroy
        flash[:notice] = "Programme has been deleted"
        redirect_to project_path(Project.find(params[:project_id]))
      else
        redirect_to projects_path
      end
    end
  private

  def project_programme_params
    params.require(:project_programme).permit(:project_id, :programme_id)
  end
end
