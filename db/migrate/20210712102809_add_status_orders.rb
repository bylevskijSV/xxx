class AddStatusOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :confirmed_by, :boolean, default: false
    add_column :orders, :closed, :boolean, default: false
  end
end
