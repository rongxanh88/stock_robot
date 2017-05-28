class CreateHistoricalDates < ActiveRecord::Migration[5.1]
  def change
    create_table :historical_dates do |t|
      t.string :date

      t.timestamps
    end
  end
end
