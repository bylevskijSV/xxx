module OrdersHelper
  require 'net/http'

  def set_confirmed_by
    @order.confirmed_by = true
    @order.total = current_order.total
    @order.save
  end

  def set_order_data_collection
    @message = String.new("Информация о заказе: #{@order.id}\n")
    @message << "-------------\n"
    @message << "Имя: #{@order.name}\nТелефон: #{@order.phone}\n"
    @message << "-------------\n"
    @message << "Улица: #{@order.street}\n"
    @message << "Номер дома: #{@order.house_number}\nНомер Подьезда:#{@order.subway_number}\n"
    @message << "Номер квартиры:#{@order.apartment_number}\n"

    if !@order.note.empty?
      @message << "Примечание: #{@order.note}\n"
    else
      @message << "Примечания отсуствуют\n"
    end
    @message << "-------------\n"

    @message << "#{current_order.order_to_string}"
    @message << "-------------\n"
    @message << "За всё: #{@order.total} BYN"

  end

  def send_order_to_telegram
    chats_id = ['126953160','1198808944']
    token = '1863932347:AAGWNuK9rXhh4G4rjR7l4kR2wWCEDBiEThM'
    chats_id.each do |chat_id|
      uri= URI("https://api.telegram.org/bot#{token}/sendMessage?")
      params = {:chat_id => chat_id, :parse_mode => 'html', :text => @message}
      uri.query = URI.encode_www_form(params)
      Net::HTTP.get(uri)
    end
  end
end
