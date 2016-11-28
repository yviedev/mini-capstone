class Order < ApplicationRecord

  belongs_to :user
  belongs_to :product, optional: true

  def pretty_time
    created_at.strftime("%b %d %y")
  end
  
end
