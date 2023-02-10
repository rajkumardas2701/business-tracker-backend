class ChangeColumnWithForeignKeyOptional < ActiveRecord::Migration[7.0]
  def change
    remove_column :financial_transactions, :user_id
    remove_column :financial_transactions, :deal_id
  end
end
