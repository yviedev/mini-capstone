class CartedProduct < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :order, optional: true
  belongs_to :user, optional: true

  def carted_product_quantity
    if quantity > product.amount
      quanity = nil
    else
      quantity
    end
  end

end
