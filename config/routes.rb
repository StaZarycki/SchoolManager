Rails.application.routes.draw do
  devise_for :users, path: "secure"
  resources :school_classes, only: [:show, :index]

  namespace :admin do
    resources :users
    resources :school_classes
  end

  root to: "pages#home"
end
