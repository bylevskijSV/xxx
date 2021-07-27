class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string  :name
      t.string  :phone
      t.string  :street
      t.integer :house_number
      t.integer :subway_number
      t.integer :apartament_number
      t.string  :note
      t.float   :total
      t.float   :tax
      t.float   :shipping
      t.boolean :confirmed_by, default: false
      t.boolean :closed, default: false
      t.string  :order_to_string
      t.timestamps
    end
  end
end
