Rails.application.routes.draw do
  devise_for :users, path: "secure"
  resources :school_classes

  root to: "pages#home"
end
