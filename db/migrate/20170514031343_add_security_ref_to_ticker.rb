class AddSecurityRefToTicker < ActiveRecord::Migration[5.1]
  def change
    add_reference :tickers, :security, foreign_key: true
  end
end
