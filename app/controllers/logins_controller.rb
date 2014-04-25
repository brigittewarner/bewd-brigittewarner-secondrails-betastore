class Customer::LoginsController < ApplicationController
	
	def create
		customer = Customer.find_by(email: params[:email])
		if customer.try(:authenticate, params[:password])
			session[:customer_id] = customer.id
			redirect_to products_path
		else
			flash.now[:danger] = 'Log In Failed'
			render 'new'
		end
	end
end