class ChatsChannel < ApplicationCable::Channel
  def subscribed
    # chatroom = ChatRoom.find(params[:id])
    stream_for "thread_#{params[:id]}"
  end

  def receive(data)
    ActionCable.server.broadcast("thread_#{params[:id]}", data)
  end

  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end

  # private

  # def fetch_room
  # end
end
