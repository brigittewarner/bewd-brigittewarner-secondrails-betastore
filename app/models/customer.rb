class Customer < ActiveRecord::Base
	attr_accessor :password_confirmation
	attr_accessor :user_name
	attr_accessor :password

    validates_confirmation_of :password

	has_many :orders
	has_many :line_items, :through => :orders
	has_many :products, :through => :line_items
	has_many :credit_cards

	has_secure_password

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true

	after_create :send_verification_email

	def self.verify(token)
		customer_id = Rails.application.message_verifier('customer').verify(token)
		customer = Customer.find(customer_id)
		customer.update!(verified_at: Time.current) unless customer.verified_at
		customer
	rescue => ex
		logger.error "Could not verify user: #{ex.class} #{ex.message}"
		nil
	end

	def send_verification_email
		CustomerMailer.welcome(self).deliver
	end
end