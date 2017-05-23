class AddSectorRefToTicker < ActiveRecord::Migration[5.1]
  def change
    add_reference :tickers, :sector, index: true, foreign_key: true
    add_reference :tickers, :industry, index: true, foreign_key: true
  end
end
