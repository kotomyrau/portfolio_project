class Admin::ProjectsController < Admin::BaseController

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project), notice: 'Your project has been created!'
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    @project_programme = ProjectProgramme.where(project_id: @project.id)
  end

  def update
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
      redirect_to admin_dashboard_path
    else
      redirect_to project_path(@project), notice: 'There was a problem, this project was not deleted!'
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :private, :company, :start_date, :end_date, :link, :image_carousel, :project_image, project_images: [])
  end
end
