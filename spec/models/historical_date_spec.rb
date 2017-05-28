require 'rails_helper'

RSpec.describe HistoricalDate, type: :model do
  describe "valid attributes" do
    it { should validate_presence_of(:date) }
  end

  describe "relationships" do
    it "has one trading data" do
      date = create(:historical_date)
      expect(date).to respond_to(:trading_data)
    end

    it "has one tickers" do
      date = create(:historical_date)
      expect(date).to respond_to(:ticker)
    end
  end
end
