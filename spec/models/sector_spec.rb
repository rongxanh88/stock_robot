require 'rails_helper'

RSpec.describe Sector, type: :model do
  describe "valid attributes" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "relationships" do
    it "has many tickers" do
      sector = create(:sector)
      expect(sector).to respond_to(:tickers)
    end
  end
end
