class MenuController < ApplicationController
  helper_method :order_pizza_include?

  def index
    @pizzas = Pizza.all
    @order_item = OrderItem.new(order_id: session[:order_id])
    # byebug
    @order_items = OrderItem.where(order_id: session[:order_id]).select(:pizza_id, :order_id)
  end

  private

  def order_pizza_include?(pizza_id)
    @order_items.each do |item|
      if item.pizza_id == pizza_id
        return true
      end
    end
    return false
  end
end
