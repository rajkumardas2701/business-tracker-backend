class Message < ApplicationRecord
  belongs_to :user, presence: true
  belongs_to :chat_room, presence: true
end
