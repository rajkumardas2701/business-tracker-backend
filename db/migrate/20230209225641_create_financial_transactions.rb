class CreateFinancialTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :financial_transactions do |t|
      t.date :date
      t.string :type
      t.string :send_receive
      t.decimal :amount
      t.text :remark

      t.timestamps
    end
  end
end
