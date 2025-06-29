class Project < ApplicationRecord
  has_many :project_programmes, dependent: :destroy
  has_many :programmes, through: :project_programmes
  has_one_attached :project_image
  has_many_attached :project_images

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :project_image, presence: true
  # validates :project_date, presence: true
  # validates :link, presence: true
  # validates :category, presence: true
end
