class OrdersController < ApplicationController

  before_action :authenticate_user!
  # before_action :authenticate_admin!

  def index
    @title = "My orders"
    @orders = Order.where(user_id: current_user)
  end

  def create
    @title = "Created order"
    @user = current_user
    
    carted_products = current_user.carted_products.where(status: "carted")

    order = Order.create!(
      user_id: current_user.id
      # these values will be updated in order.rb
      # subtotal: calculated_subtotal,
      # tax: calculated_tax,
      # total: calculated_total
      )

    carted_products.each do |item|
      item.update(status: "purchased")
      item.update(order_id: order.id)
    end

    order.save_all_totals
    
    flash[:success] = "Congrats. You made a new order."
    redirect_to "/orders/#{order.id}"
    
  end

  def show
    @title = "Order page"

    @order = Order.find(params[:id])

    # if @order.user_id == current_user.id
      render 'show.html.erb'
    # else
    #   redirect_to '/products'
    # end
    
    # @product = Product.find(@order.product_id)
    @user = current_user
    
  end

end
