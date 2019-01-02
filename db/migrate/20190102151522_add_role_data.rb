class AddRoleData < ActiveRecord::Migration[5.2]
  def up
    r = Role.create!(name: 'Administrador', code: 'admin')
    AdminUser.find_each do |au|
      au.role = r
      au.save
    end
  end

  def down
    AdminUser.find_each do |au|
      au.role = nil
    end
  end
end
