class Admin::ProjectsController < Admin::BaseController
  def new
    @project = Project.new
  end

  private

  def project_params
    params.require(:project).permit(:title,
                                    :description,
                                    :project_date,
                                    :client,
                                    :category,
                                    :link,
                                    :demoLink,
                                    :private,
                                    :project_image,
                                    project_images: [])
  end
end
