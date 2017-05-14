class CreateTickers < ActiveRecord::Migration[5.1]
  def change
    create_table :tickers do |t|
      t.text :symbol
      t.text :description

      t.timestamps
    end
  end
end
