Rails.application.routes.draw do
  resources :searches, only: %i[new create]
  root to: 'searches#new'
end
