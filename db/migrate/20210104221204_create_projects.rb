class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.date :project_date
      t.text :contributors
      t.string :link

      t.timestamps
    end
  end
end
