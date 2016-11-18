Rails.application.routes.draw do
  get 'all' => 'products#all_products'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # place to show the user form
  get '/product_form' => 'products#new_product_form'
  # place to show the user that they created a new product
  post '/created_products' => 'products#make_product'
  # return a page that creates a new form. put this line before the wildcard line.
  get '/products/new' => 'products#new'
  # show post from create
  get '/price' => 'products#index'
  post 'products' =>'products#create'
  # create an index and a show using REST
  get '/products' => 'products#index'
  get '/products/:id' => 'products#show'
  # edit and update products
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'

end
