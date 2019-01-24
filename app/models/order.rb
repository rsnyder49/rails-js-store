class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user
  before_create :set_order_status
  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.price) : 0 }.sum
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
