module ApplicationHelper

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      @order = Order.new
      @order.save(validate: false)
      session[:order_id] = @order.id
      @order
    end
  end

  def order_items_size
    OrderItem.where(order_id: session[:order_id]).size
  end

  def cart_items
    OrderItem.where(order_id: session[:order_id]).order(:created_at)
  end
end
