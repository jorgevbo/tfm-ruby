class CreateEmpresas < ActiveRecord::Migration[5.2]
  def change
    create_table :empresas do |t|
      t.string :name
      t.string :actividad
      t.integer :numeroalumnos
      t.timestamps
    end
  end
end
