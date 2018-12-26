class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :name
      t.references :course, foreign_key: true

      t.string :moodle_id
      t.string :moodle_cmid
      t.datetime :duedate

      t.timestamps
    end
  end
end
