class CreateSortItems < ActiveRecord::Migration
  def change
    create_table :sort_items do |t|
      t.string :product_id
      t.string :category_id

      t.timestamps
    end
  end
end
