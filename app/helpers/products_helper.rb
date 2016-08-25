module ProductsHelper

	def print_price(price)
		number_to_currency price
	end

	def print_stock(stock, requested = 1)
	
		if stock < 0
			"Out of stock"
		else
			if stock > requested
			"In stock"
			else
				content_tag(:span, "Insufficient stock (#{stock})", class: "low_stock")
			end
		end
	end

end
