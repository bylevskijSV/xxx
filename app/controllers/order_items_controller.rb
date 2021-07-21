class OrderItemsController < ApplicationController

  def create
    @order_item = OrderItem.create(order_item_params.merge(order_id: current_order.id))
    current_order.save(validate: false)
    session[:order_id] = current_order.id
  end

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
  end

  def destroy
    current_order.order_items.destroy(OrderItem.find(params[:id]))
    # @order_item = OrderItem.find(params[:id])
    # @order_item.destroy
  end

  private
    def order_item_params
      params.require(:order_item).permit(:pizza_id, :quantity)
    end
end
