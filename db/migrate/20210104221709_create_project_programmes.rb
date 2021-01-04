class CreateProjectProgrammes < ActiveRecord::Migration[6.0]
  def change
    create_table :project_programmes do |t|
      t.references :project, null: false, foreign_key: true
      t.references :programme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
