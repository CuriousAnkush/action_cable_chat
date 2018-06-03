class ChatRoomsChannel < ApplicationCable::Channel

  def subscribed
    stream_from "chat_rooms_#{params['chat_room_id']}_channel"
  end

  def unsubscribed

  end

  def send_message(data)
    MessageBroadcastJob.perform_later(data['message'])
  end
end