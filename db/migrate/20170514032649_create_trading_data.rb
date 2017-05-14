class CreateTradingData < ActiveRecord::Migration[5.1]
  def change
    create_table :trading_data do |t|
      t.references :ticker, foreign_key: true
      t.references :historical_date, foreign_key: true

      t.timestamps
    end
  end
end
