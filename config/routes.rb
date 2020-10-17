Rails.application.routes.draw do
  resources :songs, only: [:index,:create,:update,:show,:edit,:new]
  resources :artists , only: [:create,:update,:show,:new,:edit]
  resources :genres , only: [:create,:update,:show,:new, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
