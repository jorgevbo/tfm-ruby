ActiveAdmin.register Empresa do
#  actions :index, :show
  filter :name, label: 'Nombre'
  permit_params :name, :actividad, :numeroalumnos

  index do
    id_column
    column 'Nombre', :name
    column 'Actividad', :actividad
    column 'Numero de Alumnos', :numeroalumnos
    actions
  end
end
