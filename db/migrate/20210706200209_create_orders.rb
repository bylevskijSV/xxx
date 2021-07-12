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
      t.float   :subtotal
      t.float   :total
      t.float   :tax
      t.float   :shipping

      t.timestamps
    end
  end
end
