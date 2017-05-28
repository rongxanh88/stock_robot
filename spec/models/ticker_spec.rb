require 'rails_helper'

RSpec.describe Ticker, type: :model do
  describe "valid attributes" do
    it { should validate_presence_of(:symbol) }
    it { should validate_presence_of(:description) }
  end

  describe "relationships" do
    it "has one trading data" do
      ticker = create(:ticker)
      expect(ticker).to respond_to(:trading_data)
    end

    it "has one historical date" do
      ticker = create(:ticker)
      expect(ticker).to respond_to(:historical_date)
    end
  end
end
