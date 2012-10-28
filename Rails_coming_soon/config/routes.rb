Cmngsn::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "users#index"
  post "/new", :to => "users#create"
  
end
