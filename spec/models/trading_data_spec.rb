require 'rails_helper'

RSpec.describe TradingData, type: :model do
  describe "relationships" do
    it "has one ticker" do
      td = create(:trading_data)
      expect(td).to respond_to(:ticker)
    end

    it "has one historical date" do
      td = create(:trading_data)
      expect(td).to respond_to(:historical_date)
    end
  end
end
