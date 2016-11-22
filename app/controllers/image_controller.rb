class ImageController < ApplicationController

  def new
    Image.create!(
      url: params["image_url"],
      product_id: params["product_id"])
    render 'index.html.erb'
  end
  
end
