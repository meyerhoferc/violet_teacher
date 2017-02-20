class Course < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher
  has_many :enrollments
  has_many :students, through: :enrollments

  validates :title, :description, :subject, :location, :teacher, presence: true
  validates_uniqueness_of :title
end
