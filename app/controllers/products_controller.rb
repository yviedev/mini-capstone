class ProductsController < ApplicationController

  def all_products
    @title = "All products"
    @products = Product.all
    render 'all_products.html'
  end

  def new_product_form
    @title = "Product form"
    render 'new_form.html.erb'
  end

  def make_product
    @title = "Added product"
    @name = params["product_name"]
    @price = params["product_price"]
    @image = params["product_image"]
    @description = params["product_description"]
    
    @product = Product.new(
      name: params["product_name"],
      price: params["product_price"],
      image: params["product_image"],
      description: params["product_description"]
      )
    @product.save
    render 'make_product.html.erb'
  end
end
