Rails.application.routes.draw do
  mount API::Base, at: "/"
  resources :graduates
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
