class User < ApplicationRecord
  has_many :order_items, :through => :carts
  has_secure_password

  validates_presence_of :username, allow_blank: false

end
