class FinancialTransaction < ApplicationRecord
  belongs_to :deal, optional: true
  belongs_to :user, optional: true
end
