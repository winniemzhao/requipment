Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :equipment do
    collection do
      get :my_offerings
    end
  end
end
