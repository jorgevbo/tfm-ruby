class CreateCompetenciesAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :competencies_assignments do |t|
      t.belongs_to :competency, index: true
      t.belongs_to :assignment, index: true
    end
  end
end
