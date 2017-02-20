class Student < ApplicationRecord
  has_secure_password
  validates :name, :username, :password, :grade, presence: true
  validates_uniqueness_of :username, presence: true
  has_many :enrollments
  has_many :courses, through: :enrollments
end
