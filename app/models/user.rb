class User < ApplicationRecord
  has_secure_password
  has_many :financial_transactions
  has_many :deals, :through => :financial_transactions

  validates :name, presence: true
  validates :password, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
