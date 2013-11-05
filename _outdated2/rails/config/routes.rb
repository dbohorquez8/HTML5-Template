WwmMarkupRails::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  root to: "pages#index"
  
  get "/:action", controller: "pages"
end
