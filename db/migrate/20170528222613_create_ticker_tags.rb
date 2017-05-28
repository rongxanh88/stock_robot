class CreateTickerTags < ActiveRecord::Migration[5.1]
  def change
    create_table :ticker_tags do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :ticker, index: true, foreign_key: true

      t.timestamps
    end
  end
end
