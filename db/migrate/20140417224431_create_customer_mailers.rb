class CreateCustomerMailers < ActiveRecord::Migration
  def change
    create_table :customer_mailers do |t|

      t.timestamps
    end
  end
end
