class CartedProductsController < ApplicationController

  before_action :authenticate_user!

  def index
    @title = "All items in cart"
    if current_user
      @carted_products = CartedProduct.where(user_id: current_user.id).where(status: "carted")
      if @carted_products.count < 1
        flash[:warning] = "Please add more items to your cart in order to see the checkout page."
        redirect_to '/products'
      else
        flash[:success] = "Here are your carted products:"
        render 'index.html.erb'
      end
    else
      flash[:search] = "Please login to continue."
      redirect_to '/login'
    end
  end

  def new
  end

  def create
    @title = "Add to cart"
    @product = Product.find(params[:product_id])
    @user = current_user
    quantity = params["quantity"].to_i
    @total = quantity * @product.price

    @cartedproduct = CartedProduct.create!(
      status: "carted",
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity]
      )

    flash[:success] = "Congrats. You added items to your cart."

    redirect_to "/cartedproducts"
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.status = "removed"
    carted_product.save

    flash[:success] = "Your item was removed."

    redirect_to "/cartedproducts"
  end

end
