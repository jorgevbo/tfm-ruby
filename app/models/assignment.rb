class Assignment < ApplicationRecord
  belongs_to :course
  has_and_belongs_to_many :competencies


end
