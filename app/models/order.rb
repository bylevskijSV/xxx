class Order < ApplicationRecord
  has_many :order_items
  before_save :set_total
  before_save :set_order_string

  #validate data
  validates :name,
    presence: { message: "Поле \"Имя\" обязательно для заполнения" },
    format: { with: /[А-Яа-яЁё]/,
      message: "Использовать можно только кириллицу в имени" },
    length: { in: 3..40,
      too_long: "Слишком много символов (максимальное количество: 40, ваше %{count}",
      too_short: "Слишком мало символов, напишите полное имя(минимальное: 3)"
    },
    on: :update
  validates :phone,
    presence: { message: "Поле \"Мобильный телефон\" обязательно для заполнения" },
    format: { with: /(\+375)(29|25|44|33)(\d{3})(\d{2})(\d{2})/,
      message: "Использовать можно только цифры и код РБ, а так же операторов МТС, А1, Лайф" },
    length: { is: 13,
      wrong_length: "Неверное количество цифр, водить только мобильный номер" },
    numericality: { only_integer: true },
    on: :update
  validates :street,
    presence: { message: "Поле \"Улица\" обязательно для заполнения" },
    format: { with: /[А-Яа-яЁё]/,
      message: "Использовать можно только кириллицу в названии улицы" },
    length: { in: 3..100,
      too_long: "Слишком много символов (максимальное количество: 40, ваше %{count}",
      too_short: "Слишком мало символов, напишите полное название улицы"
    },
    on: :update
  validates :house_number, :subway_number, :apartament_number,
    presence: { message: "Поля \"Номер дома\", \"Номер подьезда\", \"Номер квартиры\" обязательны для заполнения" },
    numericality: { only_integer: true,
      message: "Использовать можно только целые числа" },
    on: :update


  # methods
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
      order_item_info << " баг"
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
