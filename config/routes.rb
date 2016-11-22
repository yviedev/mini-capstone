Rails.application.routes.draw do
  #products routes
  # return a page that creates a new form. put this line before the wildcard line.
  get '/products/new' => 'products#new'
  # show post from create
  # get '/price' => 'products#index'
  post '/products' =>'products#create'
  # create an index and a show using REST
  get '/products' => 'products#index'
  get '/products/:id' => 'products#show'
  # edit and update products
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'

  
  get '/suppliers' => 'suppliers#index'
  
end
