class FinancialTransaction < ApplicationRecord
  belongs_to :deal, optional: true
  belongs_to :user, optional: true

  def filter_side_transactions
    FinancialTransaction.where(deal_id: nil)
  end
end
