class Product < ApplicationRecord

  belongs_to :supplier
  has_many :images
  
  # belongs_to :user
  # has_many :orders

  has_many :categorized_products
  has_many :categories, through: :categorized_products

  has_many :carted_products
  has_many :users, through: :carted_products
  has_many :orders, through: :carted_products

  def sale_message
    # If an item is under $2, it returns the string “Discount Item!” - otherwise, it should return the string “On Sale!” Then, have this message appear on the product’s show page.
    if price < 2
      return "Discount Item!"
    else
      return "On Sale!"
    end
  end

  def tax
    # Create a model method called tax which will return the tax that would be charged for a particular product. (Assume a 9% tax rate.)
    tax = (price * 0.09)
    return tax
  end

  def total
    # Create a model method called total which will return the sum of the price + tax.
    (tax + price)
  end

  def in_stock?
    if in_stock
      result = "This product is in stock!"
    else
      # in_stock = false
      result = "This product is out of stock!"
    end
    return result
  end

end
