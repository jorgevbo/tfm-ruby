class Course < ApplicationRecord

  has_and_belongs_to_many :competencies
end
