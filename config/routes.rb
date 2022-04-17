Rails.application.routes.draw do
  resources :recipes
  
  resources :users, only: [:create] do
    collection do
      get :sign_up
      get :sign_in
    end
  end

  root to: "users#sign_in"
end
