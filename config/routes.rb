Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :show, :update, :edit]

  resources :subs do
    resources :posts, except: [:index]
  end

  resource :session, only: [:new, :create, :destroy]
end
