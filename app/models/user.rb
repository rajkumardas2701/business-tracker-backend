class User < ApplicationRecord
  has_secure_password
  has_many :financial_transactions
  has_many :deals
  has_many :chat_rooms, through: :messages
  has_many :messages

  validates :name, presence: true
  validates :password, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
