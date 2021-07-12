class CartsController < ApplicationController

  def show
    @order_items = current_order.order_items
    @order_id = current_order
  end
end
