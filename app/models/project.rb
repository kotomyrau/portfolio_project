class Project < ApplicationRecord
  has_many :project_programmes, dependent: :destroy
  has_many :programmes, through: :project_programmes

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

end
