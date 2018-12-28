ActiveAdmin.register Course do
  actions :index, :show

  filter :name, label: 'Nombre'
  filter :startdate, label: 'Fecha de inicio'
  filter :enddate, label: 'Fecha de fin'
  filter :moodle_id, label: 'ID Moodle'
  filter :moodle_shortname, label: 'Nombre Corto'

  index do
    id_column
    column 'Nombre', :name
    column 'Fecha de inicio', :startdate
    column 'Fecha de Fin', :enddate
    column 'ID Moodle', :moodle_id
    column 'Nombre Corto', :moodle_shortname
    column 'Nombre Completo', :moodle_fullname

    actions
  end
end
