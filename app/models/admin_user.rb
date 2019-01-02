class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  belongs_to :role

  def admin?
    return false if role.nil?
    
    role.code == Role::ADMIN
  end

  def guest?
    return true if role.nil?

    role.code == Role::GUEST
  end
end
