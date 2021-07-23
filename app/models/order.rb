class Order < ApplicationRecord
  has_many :order_items
  before_save :set_total

  #validate data
  validates :name,
    presence: true,
    format: /[А-Яа-яЁё]/,
    length: { in: 3..40 },
    on: :update
  validates :phone,
    presence: true,
    format:  /(\+375)(29|25|44|33)(\d{3})(\d{2})(\d{2})/,
    length: { is: 13 },
    numericality: { only_integer: true },
    on: :update
  validates :street,
    presence: true,
    format: /[А-Яа-яЁё]/,
    length: { in: 3..100 },
    on: :update
  validates :house_number, :subway_number, :apartament_number,
    presence: true,
    numericality: { only_integer: true },
    on: :update

  # methods
  def total_price
    order_items.collect{ |order_item| set_order_price_item(order_item) }.sum
  end

  def set_order_price_item(order_item)
    order_item.valid? ? (order_item.unit_price * order_item.quantity) : 0
  end

  private
    def set_total
      self[:total] = total_price
    end

end
