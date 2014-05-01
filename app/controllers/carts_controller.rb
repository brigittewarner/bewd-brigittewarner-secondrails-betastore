class CartsController < ApplicationController
def create
	add_to_cart params[:product_id]
end

def show
	@order = Order.from_cart(cart)
end

protected
def add_to_cart(product_id)
		cart[product_id.to_i] += 1
	end

end