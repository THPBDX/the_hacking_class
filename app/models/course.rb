class Course < ApplicationRecord
  references :teacher
  has_many :students
end
