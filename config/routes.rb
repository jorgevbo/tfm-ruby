Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/services/asignar_empresa', to: 'services#asignar_empresa'
  root 'admin/dashboard#index'
end
