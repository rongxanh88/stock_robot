class AddSectorRefToTicker < ActiveRecord::Migration[5.1]
  def change
    add_reference :tickers, :sector, foreign_key: true
    add_reference :tickers, :industry, foreign_key: true
  end
end
