class CustomerMailer < ActiveRecord::Base
	default from: "from@example.com"

	def welcome(customer)
		@customer = customer

		@token = Rails.application.message_verifier('customer').generate(@customer.id)

		mail to: @customer.email
	end
end
