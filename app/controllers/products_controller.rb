class ProductsController < ApplicationController
  # before_action :authenticate_admin!, only: [:create, :update, :destroy, :new, :edit]

  def index
    # @user = User.find_by(id: session[:user_id])
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

  def new
    @title = "New product"
    @suppliers = Supplier.all
    @product = Product.new

    render 'new.html.erb'
  end

  def create

    @title = "Created product"
    @suppliers = Supplier.all
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      description: params["description"],
      in_stock: params["in_stock"],
      supplier_id: params["supplier_id"],
      )
    
    if @product.save
      flash[:success] = "Congrats. You made a new product."
      redirect_to "/products/#{@product.id}"
    else
      render 'new.html.erb'
    end
    
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

  def edit

    @title = "Edit product"
    @product = Product.find_by(id: params["id"])
    @suppliers = Supplier.all

    # redirect_to '/products'

  end

  def update

    @title = "Update product"
    @product = Product.find_by(id: params["id"])
    @suppliers = Supplier.all
    if @product.update(
      name: params["name"], 
      price: params["price"], 
      description: params["description"], 
      in_stock: as_bool(params["in_stock"])
      )
      flash[:info] = "Congrats. You updated your product."

      redirect_to "/products/#{@product.id}"
    else
      render 'edit.html.erb'
    end      

  end

  def destroy

    @title = "Delete product"
    # grab the recipe by id
    product = Product.find_by(id: params["id"])
    # kill it
    product.destroy
    flash[:danger] = "Your product has been deleted."

    redirect_to '/products'

  end

  def as_bool (value)
    return value.downcase == "true"
  end

end