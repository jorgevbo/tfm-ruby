class Assignment < ApplicationRecord
  belongs_to :course
  has_and_belongs_to_many :competencies
  has_many :grades
  has_many :students, through: :grades

  def self.migrate_grades
    Assignment.find_each do |assignment|
      
    end
  end
end
