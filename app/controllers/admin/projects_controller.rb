class Admin::ProjectsController < Admin::BaseController

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to admin_dashboard_path, notice: 'Your project has been created!'
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :private, :company, :start_date, :end_date, :link, :project_image, project_images: [])
  end
end
