class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy

	def total
		self.order_items.sum { |item| item.subtotal }
	end


end
