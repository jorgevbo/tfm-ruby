class CreateCoursesStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :courses_students do |t|
      t.belongs_to :course, index: true
      t.belongs_to :student, index: true      
    end
  end
end
