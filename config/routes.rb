Rails.application.routes.draw do
  get 'all' => 'products#all_products'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # place to show the user form
  get '/product_form' => 'products#new_product_form'
  # place to show the user that they created a new product
  post '/created_products' => 'products#make_product'
end
