Rails.application.routes.draw do
  resources :recipe

  root to: "recipes#index"
end
