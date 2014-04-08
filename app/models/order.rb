class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :line_items
  has_many :products, :through => :line_items

  def calculate_total_amount
  	self.total_amount = line_items.inject(0) do |sum, li|
  		sum + li.total_price
  	end
  	save
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
end
