Betastore::Application.routes.draw do

  namespace :admin do
  	resources :products
  	get '/login' => 'logins#new', as: 'logins'
  	post '/login' => 'logins#create'
  end
  	resources :subscriptions
  	resources :customers
    resources :products
    resource :cart
    resources :orders

    get '/sign_up' => 'customers#new', as: 'sign_up'
    post '/sign_up' => 'customers#create'

    get '/verify/:token' => 'customers#verify', as: 'verify_customer'

    post "/products/:id/add_to_cart" => "carts#create", as: 'add_product_to_cart'

    root :to  => 'subscriptions#new'
end
