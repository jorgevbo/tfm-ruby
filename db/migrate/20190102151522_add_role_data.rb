class AddRoleData < ActiveRecord::Migration[5.2]
  def up
    r = Role.create!(name: 'Administrador', code: 'admin')
    AdminUser.find_each do |au|
      au.role = r
      au.save
    end
    r = Role.create!(name: 'Invitado', code: 'guest')
  end

  def down
    AdminUser.find_each do |au|
      au.role = nil
    end
    Role.destroy_all
  end
end
