class Programme < ApplicationRecord
  has_many :project_programmes
  has_many :projects, through: :project_programmes
end
