class OrdersController < ApplicationController


  def create
    @title = "Created order"
    @product = Product.find(params[:product_id])
    @user = current_user
    quantity = params["quantity"].to_i
    order = Order.create!(
      quantity: params["quantity"],
      user_id: current_user.id,
      product_id: params["product_id"],
      subtotal: @product.price.to_i * quantity,
      tax: @product.tax,
      total: @product.total
      )

    flash[:success] = "Congrats. You made a new order."
    redirect_to "/orders/#{order.id}"
    
  end

  def show
    @title = "Order page"

    @order = Order.find(params["id"])
    @product = Product.find(@order.product_id)
    @user = current_user

    render 'show.html.erb'
  end

end
