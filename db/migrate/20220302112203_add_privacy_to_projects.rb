class AddPrivacyToProjects < ActiveRecord::Migration[6.0]
  def change
   add_column :projects, :private, :boolean, default: false
  end
end
