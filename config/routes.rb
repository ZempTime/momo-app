Rails.application.routes.draw do
  devise_for :users

  resources :orders

  namespace "guests" do
    resources :orders, only: [:index, :show]
  end

  get "/about", to: "landing#show"

  root "landing#index"
end
