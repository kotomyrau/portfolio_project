class Project < ApplicationRecord
  has_many :project_programmes, dependent: :destroy
  has_many :programmes, through: :project_programmes
end
