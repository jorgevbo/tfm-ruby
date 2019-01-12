class Fct < ApplicationRecord
  belongs_to :empresa

  validates :student_moodle_id, uniqueness: true

  def student
    Student.find_by(moodle_id: student_moodle_id).first
  end
end
