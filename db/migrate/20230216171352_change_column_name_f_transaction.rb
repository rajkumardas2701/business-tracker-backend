class ChangeColumnNameFTransaction < ActiveRecord::Migration[7.0]
  def change
    rename_column :financial_transactions, :trans_type, :action_by
  end
end
