class Course < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher
end
