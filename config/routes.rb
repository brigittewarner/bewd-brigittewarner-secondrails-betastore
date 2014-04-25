Betastore::Application.routes.draw do

  namespace :admin do
  	resources :products
  	get '/login' => 'logins#new', as: 'logins'
  	post '/login' => 'logins#create'
  end
  	resources :subscriptions
  	resources :customers
    resources :products

    get '/sign_up' => 'customers#new', as: 'sign_up'
    post '/sign_up' => 'customers#create'

    get '/verify/:token' => 'customers#verify', as: 'verify_customer'

    root :to  => 'subscriptions#new'
end
