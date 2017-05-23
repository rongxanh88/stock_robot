class CreateTradingData < ActiveRecord::Migration[5.1]
  def change
    create_table :trading_data do |t|
      t.references :ticker, index: true, foreign_key: true
      t.references :historical_date, index: true, foreign_key: true

      t.timestamps
    end
  end
end
