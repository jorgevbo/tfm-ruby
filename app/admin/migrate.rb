ActiveAdmin.register_page 'Migrate' do

  page_action :execute, method: :post do
    operations = MoodleMigrator.start
    flash[:notice] = "El proceso se ha completado en #{operations[:seconds].to_i} seg."
    redirect_to admin_migrate_path
  end

  content do
    render partial: 'index'
  end

  sidebar 'Ayuda' do
    "Una vez iniciado el proceso, por favor espere a que la página se recargue automáticamente"
  end
end