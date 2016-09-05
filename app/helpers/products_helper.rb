module ProductsHelper

	def print_price(price)
		number_to_currency price
	end

	def print_stock(stock, requested = 1)
	
		if stock < 0
			"Out of stock"
		else
			if stock >= requested
				content_tag(:span, "In stock (#{stock})")
			else
				content_tag(:span, "No Stock! (#{stock})", class: "low-stock")
			end
		end
	end

	def get_order_quantity(product_id, order_id)
		items = Order.find(order_id).order_items
		item = items.find_by(product_id: product_id)

		if item != nil
			item.quantity
		else
			0
		end
	end

end
