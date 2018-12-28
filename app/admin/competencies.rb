ActiveAdmin.register Competency do
  actions :index, :show

  filter :name, label: 'Nombre'
  filter :competency_framework, label: 'Marco de competencia'
  filter :moodle_id, label: 'ID Moodle'
  filter :moodle_idnumber, label: 'ID Number Moodle'

  index do
    id_column
    column 'Nombre', :name
    column 'Marco de competencia', :competency_framework
    column 'ID Moodle', :moodle_id
    column 'ID Number Moodle', :moodle_idnumber
    actions
  end
end
