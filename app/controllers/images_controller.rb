class ImagesController < ApplicationController

  def new
    @title = "Add new images"
    @products = Product.all
    render 'new.html.erb'
  end

  def create
    @title = "Create images"
    @product = Product.find(params["product_id"])

    image = Image.create!(
      url: params[:url],
      product_id: params[:product_id]
    )
    
    flash[:info] = "Congrats. You added photos to your product."
    redirect_to "/products/#{@product.id}" 
    
  end

  def show
    @product = Product.find(params["product_id"])
    redirect_to "/products/#{@product.id}"
  end

end
