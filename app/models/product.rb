class Product < ApplicationRecord
	validates :title, :stock, :price, :image_url, presence: true
	validates :price, numericality: {}
	validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

	has_many :order_items

	def price=(input)
		input.delete!("$")
		super
	end
end