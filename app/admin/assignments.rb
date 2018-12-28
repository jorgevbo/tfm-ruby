ActiveAdmin.register Assignment do
  actions :index, :show
  

  filter :name, label: 'Nombre'
  filter :course, label: 'Curso' 
  filter :competencies, label: 'Competencia'

  filter :moodle_id, label: 'ID Moodle'
  filter :moodle_cmid, label: 'CMID Moodle'
  filter :duedate, label: 'Fecha de entrega'

  index do
    id_column
    column 'Nombre', :name
    column 'Curso', :course
    column 'ID Moodle', :moodle_id
    column 'CMID Moodle', :moodle_cmid
    column 'Fecha de entrega', :duedate
    actions
  end
end
