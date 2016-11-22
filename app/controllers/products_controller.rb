class ProductsController < ApplicationController

  def index
    @title = "All products"
    @sort = params["sort"]
    @direction = params["direction"]

    if params["sort"]
      @products = Product.order(@sort => @direction)
    elsif params["discount_item"]
      @products = Product.where("price < ?", 2)
    elsif params["search_content"]
      @products = Product.where("lower (name) LIKE ?", "%#{params["search_content"].downcase}%")
      flash[:search] = "Here is the result of your search:"
    else
      @products = Product.all
    end

    render 'index.html.erb'
  end

  def show
    @title = "Product page"

    if params["id"] == 'random_product'
      @product = Product.all.sample
      flash[:random] = "Here is the product of the day:"
    else
      @product = Product.find_by(id: params["id"])
    end

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
      description: params["description"],
      in_stock: params["in_stock"],
      supplier_id: params["supplier_id"],
      image_id: params["image_id"]
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
    product.update(
      name: params["name"], 
      price: params["price"], 
      image: params["image"], 
      description: params["description"], 
      in_stock: as_bool(params["in_stock"])
      )
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

  def as_bool (value)
    return value.downcase == "true"
  end

end
