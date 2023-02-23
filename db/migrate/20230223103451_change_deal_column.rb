class ChangeDealColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :deals, :f_actual_amount, :vehicle_fare
    rename_column :deals, :d_actual_amount, :labour_charge
  end
end
