class CreateDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :deals do |t|
      t.string :vehicle_date
      t.string :f_name
      t.float :f_quantiy
      t.float :f_choot
      t.decimal :f_rate
      t.string :d_name
      t.float :d_quantity
      t.float :d_choot
      t.decimal :d_rate
      t.decimal :f_actual_amount
      t.decimal :d_actual_amount
      t.decimal :balance

      t.timestamps
    end
  end
end
