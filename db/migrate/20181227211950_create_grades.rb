class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.references :student, foreign_key: true
      t.references :assignment, foreign_key: true
      t.string :score
      t.string :moodle_userid
      t.string :moodle_assignment_id

      t.timestamps
    end
  end
end
