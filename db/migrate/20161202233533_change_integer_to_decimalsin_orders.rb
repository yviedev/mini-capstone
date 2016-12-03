class ChangeIntegerToDecimalsinOrders < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :subtotal, :decimal, precision: 7, scale: 2
    change_column :orders, :tax, :decimal, precision: 7, scale: 2
    change_column :orders, :total, :decimal, precision: 7, scale: 2
  end
end
