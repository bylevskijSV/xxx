class HomeController < ApplicationController

  def index
    @pizzas = Pizza.all
    @order_item = OrderItem.create(order_id: current_order.id)
  end


end
