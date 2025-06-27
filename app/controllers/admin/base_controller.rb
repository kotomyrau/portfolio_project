# app/controllers/admin/base_controller.rb
class Admin::BaseController < ApplicationController
  before_action :authorise_admin!

  private

  def authorise_admin!
    unless current_user&.role_admin?
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end
end
