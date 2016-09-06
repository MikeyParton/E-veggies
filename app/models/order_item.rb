class OrderItem < ApplicationRecord
	validates :order_id, presence: true
	validates :product_id, presence: true
	validates :quantity, numericality: {only_integer: true, greater_than_or_equal_to: 0}
	validate :check_stock

	belongs_to :order
	belongs_to :product


	def check_stock
		puts self.product.stock
		puts self.quantity
		if self.product.stock < self.quantity
			self.errors[:base] << "- #{self.product.title} (#{self.product.stock} in stock)"
			false
		end
    end

	def subtotal
		self.quantity * self.product.price
	end

	def remove_stock
		product.stock -= self.quantity
		product.save
	end

end
