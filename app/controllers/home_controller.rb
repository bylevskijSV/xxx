class HomeController < ApplicationController
  include HomeHelper

  def index
    @pizzas = Pizza.all
    @order_item = current_order.order_items.new
    @order_id = current_order
  end


end
