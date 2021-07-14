class AddOrderToStringToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :order_to_string, :string
  end
end
