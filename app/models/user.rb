class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :password, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
