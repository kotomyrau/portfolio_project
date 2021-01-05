class ProjectProgrammesController < ApplicationController
  def new
    @project_programme = ProjectProgramme.new
  end

  def create
  end

  private

  def project_programme_params
    params.require(:project_programme).permit(:project_id, :programme_id)
  end
end
