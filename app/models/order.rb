class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :credit_card, inverse_of: :orders
  has_many :line_items, inverse_of: :order

  validates :customer_id, :credit_card, presence: true
  validate :credit_card_belongs_to_customer

  accepts_nested_attributes_for :credit_card
  accepts_nested_attributes_for :line_items

  after_create :charge

  def self.from_cart(cart)
    order = new
    cart.each do |product_id, quantity|
      order.line_items.build(
          product_id: product_id,
          quantity: quantity
        )
    end
    order
  end

  def calculate_total_amount
  	self.total_amount = line_items.inject(0) do |sum, li|
  		sum + li.total_price
  	end
  	save
  end

  def credit_card_belongs_to_customer
    if customer_id && credit_card_id
      unless customer_id == credit_card.customer_id
        errors.add(credit_card_id, "does not belong to this customer")
      end
    end
  end


  def increment_total_amount(amount)
  	update(total_amount: (total_amount || 0) + amount)
  	# self.total_amount ||= 0
	# self.total_amount += total_price
	# save
	end

  def self.total_revenue
    connection.select_value("SELECT sum(total_amount) FROM orders").to_d
  end

  def self.total_revenue_per_customer
    connection.select_all("SELECT sum(total_amount)
      FROM orders
      GROUP by customer_id")
  end

  def charge
    OrderChargeWorker.perform_async(id)
  end
end
