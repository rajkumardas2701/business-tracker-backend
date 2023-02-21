class FinancialTransaction < ApplicationRecord
  belongs_to :deal, optional: true
  belongs_to :user, optional: true

  validates :date, presence: true
  validates :send_receive, presence: true
  validates :amount, presence: true
  validates :action_by, presence: true
  validates :remark, presence: true
end
