class OrderItemsController < ApplicationController

  def create
    # v1
    # @order_item = OrderItem.new(order_item_params)
    # @order_item.order_id = current_order.id
    # @order_item.save
    # current_order.save validate: false
    # session[:order_id] = @order.id

    # v2
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save(validate: false)
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_item_params)
    @order_items = @order.order_items.order(:created_at)
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items.order(:created_at)
  end

  private
    def order_item_params
      params.require(:order_item).permit(:pizza_id, :quantity)
    end
end
