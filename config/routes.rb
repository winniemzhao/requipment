Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :equipment do
    resources :requests, only: %i[new create]
  end

  get "/my-requests", to: "requests#my_requests", as: :my_requests
  get "/my-requests/:id", to: "requests#show", as: :my_request
  get "/my-requests/:id/edit", to: "requests#edit", as: :edit_my_request
  patch "/my-requests/:id", to: "requests#update"
  delete "/my-requests/:id", to: "requests#destroy"

  get "/my-offerings", to: "equipment#my_offerings", as: :my_offerings

  get "/my-offerings-requests", to: "requests#my_offering_requests", as: :my_offering_requests
  get "/my-offerings-requests/:id/edit", to: "requests#edit_offering_requests", as: :edit_my_offering_request
  patch "my-offerings-requests/:id", to: "requests#update_offering_requests", as: :update_my_offering_request


end
