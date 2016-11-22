class SuppliersController < ApplicationController

  def new
    @suppliers = Supplier.all
    render 'index.html.erb'
  end

  def index
    @suppliers = Supplier.all
    render 'index.html.erb'
  end

end
