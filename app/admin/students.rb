ActiveAdmin.register Student do
  actions :index, :show

  filter :firstname, label: 'Nombres'
  filter :lastname, label: 'Apellidos'
  filter :moodle_id, label: 'ID Moodle'
  filter :courses, label: 'Curso'

  index do
    id_column
    column 'Nombres', :firstname
    column 'Apellidos', :lastname
    column 'ID Moodle', :moodle_id
    actions
  end
end
