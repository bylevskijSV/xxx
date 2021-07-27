require 'rails_helper'

RSpec.describe Order, type: :model do
  context "When all fields are filled in" do
    it "checkout with an empty cart" do
      order = Order.create(:name => "Сергей", :phone => "+375333217284", :street => "Волковыская", :house_number => 1, :subway_number => 1, :apartament_number => 1)
      expect(order.total).to eq(0)
    end

    it "one item in cart" do
      order = Order.create(:name => "Сергей", :phone => "+375333217284", :street => "Волковыская", :house_number => 1, :subway_number => 1, :apartament_number => 1)
      order.order_items.create!(:pizza_id => 1, :quantity => 1)
      expect(order.total).to eq(12)
    end
  end
end
