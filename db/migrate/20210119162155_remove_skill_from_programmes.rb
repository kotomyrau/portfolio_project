class RemoveSkillFromProgrammes < ActiveRecord::Migration[6.0]
  def change
    remove_column :programmes, :skill
  end
end
