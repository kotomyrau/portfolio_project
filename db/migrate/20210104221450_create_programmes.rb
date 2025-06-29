class CreateProgrammes < ActiveRecord::Migration[6.0]
  def change
    create_table :programmes, id: :uuid do |t|
      t.string :name
      t.integer :skill

      t.timestamps
    end
  end
end
