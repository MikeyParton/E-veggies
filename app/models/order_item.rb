class OrderItem < ApplicationRecord
	validates :order_id, presence: true
	validates :product_id, presence: true
	validates :quantity, numericality: {only_integer: true, greater_than_or_equal_to: 0}

	belongs_to :order
	belongs_to :product


	def subtotal
		self.quantity * self.product.price
	end

end
