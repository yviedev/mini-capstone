class ProductsController < ApplicationController

  def all_products
    @products = Product.all
    render 'all_products.html'
  end
end
