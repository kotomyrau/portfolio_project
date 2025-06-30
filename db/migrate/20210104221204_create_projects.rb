class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects, id: :uuid do |t|
      t.string :title
      t.text :description
      t.string :company
      t.boolean :private, default: true
      t.string :link
      t.date :start_date
      t.date :end_date
      t.boolean :image_carousel, default: false

      t.timestamps
    end
  end
end
