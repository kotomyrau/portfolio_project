class AddCategoryToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :category, :string
    rename_column :projects, :contributors, :client
  end
end
