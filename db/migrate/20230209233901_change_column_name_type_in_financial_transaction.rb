class ChangeColumnNameTypeInFinancialTransaction < ActiveRecord::Migration[7.0]
  def change
    rename_column :financial_transactions, :type, :trans_type
  end
end
