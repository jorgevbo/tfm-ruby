class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.datetime :startdate
      t.datetime :enddate

      t.timestamps
    end
  end
end
