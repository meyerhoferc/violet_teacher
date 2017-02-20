class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :student
  validates :student, :course, presence: true
end
