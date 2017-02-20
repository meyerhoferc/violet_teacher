class Teacher < ApplicationRecord
  has_many :courses
  validates :name, :username, :department, presence: true
  validates_uniqueness_of :username
  has_secure_password
end
