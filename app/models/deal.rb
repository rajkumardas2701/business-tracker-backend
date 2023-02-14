class Deal < ApplicationRecord
  has_many :financial_transactions
  has_many :users, through: :financial_transactions

  validates :vehicle_date, presence: true, uniqueness: true
end
