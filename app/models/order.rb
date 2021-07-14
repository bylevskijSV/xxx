class Order < ApplicationRecord
  has_many :order_items
  before_save :set_total
  before_save :set_order_string

  def total
    order_items.collect{|order_item| order_item.valid? ? (order_item.unit_price * order_item.quantity) : 0}.sum
  end

  def order_to_s
    order_item_info = "Пиццы:\n"

    if !order_items.empty?
      order_items.each do |item|
        order_item_info << "#{item.pizza.name}:#{item.quantity}\n"
      end
    else
      order_item_info << " нету"
    end

    return order_item_info
  end



  private
    def set_total
      self[:total] = total
    end

    def set_order_string
      self[:order_to_string] = order_to_s
    end

end
