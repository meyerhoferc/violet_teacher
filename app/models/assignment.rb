class Assignment < ApplicationRecord
  validates :title, :point_value, :course, presence: true
  validates_uniqueness_of :title
  belongs_to :course
end
