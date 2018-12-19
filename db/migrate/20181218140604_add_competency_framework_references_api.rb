class AddCompetencyFrameworkReferencesApi < ActiveRecord::Migration[5.2]
  def change
    add_column :competency_frameworks, :moodle_id, :string
    add_column :competency_frameworks, :moodle_contextid, :string
    add_column :competency_frameworks, :moodle_contextname, :string
    add_column :competency_frameworks, :moodle_idnumber, :string
  end
end
