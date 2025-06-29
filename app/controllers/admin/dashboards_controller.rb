class Admin::DashboardsController < Admin::BaseController

  def dashboard
    @projects = Project.order('start_date DESC')
  end
end
