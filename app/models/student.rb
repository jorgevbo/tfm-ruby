class Student < ApplicationRecord
  has_and_belongs_to_many :courses

  has_many :grades
  has_many :assignments, through: :grades

  def fct?
    !Fct.find_by(student_moodle_id: self.moodle_id).nil?
  end

  def fct
    Fct.find_by(student_moodle_id: self.moodle_id)
  end
end
