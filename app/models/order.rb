class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy
	belongs_to :user, optional: true
	belongs_to :address, optional: true

	validates :order_items, presence: { on: :update, message: " - Oops your cart is empty!" }
	validates :address, presence: { on: :update, message: " - Where do you want us to send your veggies?" }
	validates_associated :order_items, on: :update, message: "We don't have enough:"

	def total
		self.order_items.sum { |item| item.subtotal }
	end

end