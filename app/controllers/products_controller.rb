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

  def index
    @title = "All products"
    @products = Product.all
    render 'index.html.erb'
  end

  def show
    @title = "Product page"
    @product = Product.find_by(id: params["id"])
    render 'show.html.erb'
  end

  def new
    @title = "New product"
    render 'new.html.erb'
  end

  def create
    @title = "Created product"
    product = Product.new(
      name: params["name"],
      price: params["price"],
      image: params["image"],
      description: params["description"]
      )
    product.save
    flash[:success] = "Congrats. You made a new product."
    redirect_to "/products/#{product.id}"
    #render 'create.html.erb'
  end

  def edit
    @title = "Edit product"
    @product = Product.find_by(id: params["id"])
    render 'edit.html.erb'
  end

  def update
    @title = "Update product"
    product = Product.find_by(id: params["id"])
    product.update(name: params["name"], price: params["price"], image: params["image"], description:params["description"])
    flash[:info] = "Congrats. You updated your product."
    redirect_to "/products/#{product.id}"
  end

  def destroy
    @title = "Delete product"
    # grab the recipe by id
    product = Product.find_by(id: params["id"])
    # kill it
    product.destroy
    flash[:danger] = "Your product has been deleted."
    redirect_to "/products/"
  end

end
