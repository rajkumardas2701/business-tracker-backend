class ChatsChannel < ApplicationCable::Channel
  def subscribed
    stream_for ChatRoom.find(params[:chat_room_id])
    # stream_for @chatRoom
  end

  def receive(data)
    message = @chatRoom.messages.create(message: data['body'], user_id: current_user)
    ChatsChannel.broadcast_to(@chatRoom, message: message.as_json)
  end

  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end
end
