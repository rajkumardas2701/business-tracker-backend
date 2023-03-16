class RemoveMessageFromChatRoom < ActiveRecord::Migration[7.0]
  def change
    remove_column :chat_rooms, :Message, :string
  end
end
