class Admin::ProjectsController < Admin::BaseController
  def new
    @project = Project.new
  end

  private

  def project_params
    params.require(:project).permit(:title,
                                    :description,
                                    :private,
                                    :company,
                                    :start_date,
                                    :end_date,
                                    :link,
                                    :project_image,
                                    project_images: [])
  end
end
