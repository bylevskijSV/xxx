class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :pizza_id
      t.integer :order_id
      t.float   :unit_price
      t.integer :quantity
      t.float   :total_price

      t.timestamps
    end
  end
end
