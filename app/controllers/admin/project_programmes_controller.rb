class Admin::ProjectProgrammesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @project_programme = @project.project_programmes.new
    @projects = Project.all
    @programmes = Programme.all
  end

  def create
    @user = current_user
    @projects = Project.all
    @project = Project.find(params[:project_id])
    @project_programme = ProjectProgramme.new(project_programme_params)
    if @project_programme.save
      redirect_to project_path(@project), notice: "Programme has been added to the project"
    else
      render :new
    end
  end

  def destroy
    # @project = Project.find(params[:id])
    @project_programme = ProjectProgramme.find(params[:id])
    # @project_programme = ProjectProgramme.find_by(project_id: params[:id], programme_id: params[:id])
    # @user = current_user

    if @project_programme.destroy
      # flash[:notice] = "Programme has been deleted"
      redirect_to project_path(params[:project_id])
    else
      # flash[:notice] = "An error occured, try again"
      redirect_to project_path(params[:project_id])
    end
  end
  private

  def project_programme_params
    params.require(:project_programme).permit(:project_id, :programme_id)
  end
end
