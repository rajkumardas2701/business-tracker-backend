class ChangeColumnWithForeignKeyOptionalInFinancialTransaction < ActiveRecord::Migration[7.0]
  def up
    remove_foreign_key :financial_transactions, :users
    remove_foreign_key :financial_transactions, :deals
  end
end
