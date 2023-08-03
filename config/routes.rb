Rails.application.routes.draw do
  resources :searches, only: %i[new]
  root to: 'searches#new'
end
