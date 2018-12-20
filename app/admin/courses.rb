ActiveAdmin.register Course do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
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
