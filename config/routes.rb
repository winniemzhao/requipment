Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :equipment do
    resources :requests, only: %i[new create]
    get "/requests", to: "requests#my_offering_requests", as: :my_offering_requests
    get "/requests/:id/edit", to: "requests#edit_offering_request", as: :edit_offering_request
    patch "/requests/:id", to: "requests#update_offering_request", as: :update_offering_request
  end
  get "/my-requests", to: "requests#my_requests", as: :my_requests
  get "/my-requests/:id", to: "requests#show", as: :my_request
  patch "/my-requests/:id", to: "requests#update"
  delete "/my-requests/:id", to: "requests#destroy"
  get "/my-requests/:id/edit", to: "requests#edit", as: :edit_my_request
  get "/my-offerings", to: "equipment#my_offerings", as: :my_offerings
end
