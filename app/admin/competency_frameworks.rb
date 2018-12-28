ActiveAdmin.register CompetencyFramework do
  actions :index, :show

  filter :name, label: 'Nombre'
  filter :moodle_id, label: 'ID Moodle'
  filter :moodle_idnumber, label: 'ID Number Moodle'

  index do
    id_column
    column 'Nombre', :name
    column 'ID Moodle', :moodle_id
    column 'ID Contexto', :moodle_contextid
    column 'Nombre Contexto', :moodle_contextname
    column 'ID Number Moodle', :moodle_idnumber
    actions
  end
end
