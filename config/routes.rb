Rails.application.routes.draw do
  resources :line_items do
    member :add_to_cart
  end
  resources :cours
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"
end
