Rails.application.routes.draw do
  #products routes
  # return a page that creates a new form. put this line before the wildcard line.
  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  post '/products' =>'products#create'
  get '/products/:id' => 'products#show'
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'
  
  get '/suppliers' => 'suppliers#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  post '/products/:id' => 'products#show'
  post '/products/:id/images' =>'images#create'
  get '/products/:id/images/new' => 'images#new'

  post "/orders" => 'orders#create'
  get '/orders/:id' => 'orders#show'
  
end
