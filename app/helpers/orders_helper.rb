module OrdersHelper
  require 'net/http'

  def set_confirmed_by
    @order.confirmed_by = true
    @order.save
  end

  def order_to_string
    order_item_info = "Пиццы:\n"

    if !@order.order_items.empty?
      @order.order_items.each do |item|
        order_item_info << "#{item.pizza.name}:#{item.quantity}\n"
      end
    else
      ActiveModel::Error.new(Order, :order_to_string, :too_short, count: 1)
    end

    return order_item_info
  end

  def set_order_data_collection
    message = String.new("Информация о заказе: #{@order.id}\n")
    message << "-------------\n"
    message << "Имя: #{@order.name}\nТелефон: #{@order.phone}\n"
    message << "-------------\n"
    message << "Улица: #{@order.street}\n"
    message << "Номер дома: #{@order.house_number}\nНомер Подьезда:#{@order.subway_number}\n"
    message << "Номер квартиры:#{@order.apartament_number}\n"

    if !@order.note.empty?
      message << "Примечание: #{@order.note}\n"
    else
      message << "Примечания отсуствуют\n"
    end
    message << "-------------\n"

    message << "#{order_to_string}"
    message << "-------------\n"
    message << "За всё: #{@order.total} BYN"

    return message
  end

  def send_order_to_telegram
    message = set_order_data_collection
    chat_ids = Rails.configuration.chat_ids
    token = Rails.configuration.token
    # Если есть токен в переменной окружения отправить сообщение в телеграм-бот
    if token
      chat_ids.each do |chat_id|
        uri= URI("https://api.telegram.org/bot#{token}/sendMessage?")
        params = {:chat_id => chat_id, :parse_mode => 'html', :text => message}
        uri.query = URI.encode_www_form(params)
        Net::HTTP.get(uri)
      end
    end
  end

  def order_total
    current_order.save(validate: false)
    current_order.total
  end
end
