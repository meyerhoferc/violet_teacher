class Student < ApplicationRecord
  has_secure_password
  validates :name, :username, :password, :grade, presence: true
  validates_uniqueness_of :username, presence: true
end
