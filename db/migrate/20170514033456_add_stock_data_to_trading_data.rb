class AddStockDataToTradingData < ActiveRecord::Migration[5.1]
  def change
    add_column :trading_data, :open, :float
    add_column :trading_data, :high, :float
    add_column :trading_data, :close, :float
    add_column :trading_data, :volume, :bigint
    add_column :trading_data, :avg_volume, :bigint
    add_column :trading_data, :week_52_high, :float
    add_column :trading_data, :week_52_low, :float
  end
end
