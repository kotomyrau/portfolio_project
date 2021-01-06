class ProjectProgramme < ApplicationRecord
  belongs_to :project
  belongs_to :programme

  validates :project_id, presence: true
  validates :programme_id, presence: true
end
