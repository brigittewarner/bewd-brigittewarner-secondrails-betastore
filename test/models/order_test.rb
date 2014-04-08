require 'test_helper'

class OrderTest < ActiveSupport::TestCase

	def test_total_amount
		assert equal 24, sum(Order.total_amount)
	end

  # test "the truth" do
  #   assert true
  # end
end
