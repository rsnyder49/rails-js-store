class Item < ApplicationRecord
  has_many :order_items
  has_many :reviews
  has_many :transactions
  has_many :users, through: :transactions
end
