class CreateFcts < ActiveRecord::Migration[5.2]
  def change
    create_table :fcts do |t|
      t.references :empresa, foreign_key: true
      t.string :student_moodle_id

      t.timestamps
    end
  end
end
