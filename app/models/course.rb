class Course < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher

  validates :title, :description, :subject, :location, :teacher, presence: true
  validates_uniqueness_of :title
end
