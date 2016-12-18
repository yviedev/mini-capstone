class Order < ApplicationRecord

  belongs_to :user
  belongs_to :product, optional: true

  has_many :carted_products
  # has_many :users, through: :carted_products
  has_many :products, through: :carted_products

  def pretty_time
    created_at.strftime("%B %y %d")
  end

  def calculated_subtotal
    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.product.price * carted_product.quantity
    end
    subtotal
  end

  def calculated_tax
    # Create a model method called tax which will return the tax that would be charged for a particular product. (Assume a 9% tax rate.)
    calculated_subtotal * 0.09
  end

  def calculated_total
    # Create a model method called total which will return the sum of the price + tax.
    calculated_total = calculated_tax + calculated_subtotal
  end

  def save_all_totals
    update(subtotal: calculated_subtotal, total: calculated_total, tax: calculated_tax)
  end

end
