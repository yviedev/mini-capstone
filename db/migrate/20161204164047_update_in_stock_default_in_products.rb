class UpdateInStockDefaultInProducts < ActiveRecord::Migration[5.0]
  def change
    change_column_default :products, :in_stock, from: nil, to: true
  end
end
