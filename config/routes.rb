Rails.application.routes.draw do
  devise_for :users, path: "secure"
  resources :school_classes

  namespace :admin do
    resources :users
  end

  root to: "pages#home"
end
