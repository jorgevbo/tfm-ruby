class AddRoleToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :admin_users, :role, foreign_key: true
  end
end
