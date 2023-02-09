class AddColumnToFinancialTransaction < ActiveRecord::Migration[7.0]
  def change
    add_reference :financial_transactions, :user, foreign_key: true
    add_reference :financial_transactions, :deal, foreign_key: true
  end
end
