class CreateCompetencyCourse < ActiveRecord::Migration[5.2]
  def change
    create_table :competency_courses do |t|
      t.belongs_to :competency, index: true
      t.belongs_to :course, index: true
    end
  end
end
