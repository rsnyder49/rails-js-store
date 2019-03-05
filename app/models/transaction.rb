class Transaction < ApplicationRecord
  belongs_to :items
  has_many :users, through: :items
end
