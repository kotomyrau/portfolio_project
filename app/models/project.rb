class Project < ApplicationRecord
  has_many :project_programmes
  has_many :programmes, through: :project_programmes
end
