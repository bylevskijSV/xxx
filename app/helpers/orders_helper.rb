module OrdersHelper
  require 'net/http'

  def set_confirmed_by
    @order.confirmed_by = true
    @order.total = current_order.total
    @order.save
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

    message << "#{current_order.order_to_string}"
    message << "-------------\n"
    message << "За всё: #{@order.total} BYN"

    return message
  end

  def send_order_to_telegram
    message = set_order_data_collection
    byebug
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
end
