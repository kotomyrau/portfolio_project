class ProgrammesController < ApplicationController
    def show
      @programme = Programme.find(params[:id])
      @project_programme = ProjectProgramme.where(programme_id: @programme.id)
    end
end
