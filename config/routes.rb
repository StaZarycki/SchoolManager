Rails.application.routes.draw do
  devise_for :users, path: "secure"
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "pages#home"
end
