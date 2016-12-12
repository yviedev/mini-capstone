class User < ApplicationRecord
  has_secure_password

  # has_many :products
  has_many :orders

  has_many :carted_products
  # has_many :orders, through: :carted_products
  has_many :products, through: :carted_products

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, length: { minimum: 6 }
  
end
