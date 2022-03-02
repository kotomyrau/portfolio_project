class PagesController < ApplicationController
  skip_before_action :auth_viewer

  def home
    @preview_projects = Project.where(private: false).last(3)
    @user = User.find_by(email: "koto@admin.com")
  end

  def about
    @user = User.find_by(email: "koto@admin.com")
    @programmes = Programme.order('name ASC')
  end
end
