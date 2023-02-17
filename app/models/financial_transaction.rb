class FinancialTransaction < ApplicationRecord
  belongs_to :deal, optional: true
  belongs_to :user, optional: true

  validates :date, presence: true
  validates :send_receive, presence: true
  validates :amount, presence: true
  validates :action_by, presence: true
  validates :remark, presence: true

  def filter_side_transactions
    txs = FinancialTransaction.where(deal_id: nil)
    txs.order(date: :desc)
  end
end
