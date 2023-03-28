class DealSerializer < ActiveModel::Serializer
  attributes :id, :vehicle_date, :f_name, :f_quantiy, :f_choot, :f_rate, :d_name, :d_quantity, :d_choot, :d_rate, :vehicle_fare, :labour_charge, :balance
end
