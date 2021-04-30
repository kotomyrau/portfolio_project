class AddDemoToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :demoLink, :string
  end
end
