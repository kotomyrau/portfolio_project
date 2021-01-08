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
    # @project = ProjectProgramme.find(params[:project_id])
    @project_programme = ProjectProgramme.new(project_programme_params)
    if @project_programme.save
      redirect_to project_path(params[:project_id])
    else
      render :new
    end
  end

    def destroy
      # @user = current_user
      @project_programme = ProjectProgramme.find(params[:id])
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
