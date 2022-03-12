Rails.application.routes.draw do
  resources :orders
  namespace "guests" do
    resources :orders, only: [:index, :show]
  end

  get "/about", to: "landing#show"

  root "landing#index"
end
