Rails.application.routes.draw do
  resources :recipes
  
  resources :users, only: [:create] do
    collection do
      get :sign_up
      get :sign_in
    end
  end

  post "/users/sign_in", to: "sessions#create", as: "login"
	delete "/users", to: "sessions#destroy", as: "logout"

  root to: "users#sign_in"
end
