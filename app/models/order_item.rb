class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

  private

  def product_present
    if product.nil?
      flash[:error] = "Item Currently Out of Stock"
    end
  end

  def order_present
    if order.nil?
      flash[:error] = "Please add an Item to your Cart Before Checking Out"
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
  
end
