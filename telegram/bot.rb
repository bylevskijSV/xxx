require File.expand_path('../config/environment', __dir__)

require 'telegram/bot'

token = ENV['TELEGRAM_TOKEN']

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when "/add"
      bot.api.send_message(chat_id: message.chat.id, text: "Send me bot username")
    when "/delete"
      bot.api.send_message(chat_id: message.chat.id, text: "Pick bot to delete")
    when "/search"
      bot.api.send_message(chat_id: message.chat.id, text: "Send me your request")
    end
  end
end
