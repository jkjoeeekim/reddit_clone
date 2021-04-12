Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :show, :update, :edit]

  resource :session, only: [:new, :create, :destroy]
end
