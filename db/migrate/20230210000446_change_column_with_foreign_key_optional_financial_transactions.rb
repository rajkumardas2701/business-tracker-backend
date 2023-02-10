class ChangeColumnWithForeignKeyOptionalFinancialTransactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :financial_transactions, :user, foreign_key: true, null: true
    add_reference :financial_transactions, :deal, foreign_key: true, null: true
  end
end
