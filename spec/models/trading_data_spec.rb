require 'rails_helper'

RSpec.describe TradingData, type: :model do
  describe "valid attributes" do
    it { should validate_presence_of(:open) }
    it { should validate_presence_of(:high) }
    it { should validate_presence_of(:close) }
    it { should validate_presence_of(:volume) }
    it { should validate_presence_of(:avg_volume) }
    it { should validate_presence_of(:week_52_high) }
    it { should validate_presence_of(:week_52_low) }
  end

  describe "relationships" do
    it "belongs to ticker" do
      td = create(:trading_data)
      expect(td).to respond_to(:ticker)
    end

    it "belongs to historical date" do
      td = create(:trading_data)
      expect(td).to respond_to(:historical_date)
    end
  end
end
