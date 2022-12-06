Rails.application.routes.draw do
  resources :sneakers do
    resources :reviews, only: [:index, :create, :edit, :update, :destroy, :new]
  end
  get 'site/index'
  post 'site/add', as: :add
  post 'site/remove', as: :remove
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :cart, only: [:show]
  scope 'cart/:sneaker_id' do
    post 'add', to:'line_items#update', as: :add_to_cart
    delete 'remove', to: 'line_items#destroy', as: :remove_from_cart
  end

  # Defines the root path route ("/")
  root "sneakers#index"
end
