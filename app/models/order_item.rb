class OrderItem < ApplicationRecord
	validates :order_id, presence: true
	validates :product_id, presence: true

	belongs_to :order
	belongs_to :product
end
