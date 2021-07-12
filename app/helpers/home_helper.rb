module HomeHelper
  def pizza_include?(pizza_id)
    @order_items = OrderItem.where(order_id: @order_id, pizza_id: pizza_id).to_a
  end
end
