class CreditCard < ActiveRecord::Base
	belongs_to :customer

	before_validation :normalize_card_number

	validates :customer_id, presence: true
	validates :card_number, presence: true, format: { with: /\A\d{15,15}\z/, allow_blank: true}

	validates :validate_expiration_date

	def normalize_card_number
		if card_number.present?
		self.card_number = card_number.gsub(/\D/,' ')
	end
	end

	def expires_at
		@expires_at ||= Date.strptime(expiration_date, '%m/%Y') + 1.month
	end

	def validate_expiration_date
		if expiration_date.blank?
			errors.add(:expiration_date, 'is required')
		elsif expiration_date
		end
	end

	def expiry=(expiry)
		self.expires_on = Date.strptime(expiry, '%m/%y')+1.month
	end
end