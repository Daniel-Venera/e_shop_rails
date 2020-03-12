Rails.application.routes.draw do
  root "items#index"

  resources :items do
    resources :cart_items, only: [:create, :destroy]
    resources :image_urls, only: [:create]
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show] do
    resources :carts, only: [:show] do
      resources :orders, only: [:create, :show]
    end
  end
			resources :charges

  get "/statics/:static" => "statics#show"
end
