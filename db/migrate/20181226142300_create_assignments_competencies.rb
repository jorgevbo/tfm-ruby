class CreateAssignmentsCompetencies < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments_competencies do |t|
      t.belongs_to :assignment, index: true
      t.belongs_to :competency, index: true
    end
  end
end
