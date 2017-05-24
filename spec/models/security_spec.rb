require 'rails_helper'

RSpec.describe Security, type: :model do
  describe "valid attributes" do
    it { should validate_presence_of(:security_type) }
    it { should validate_uniqueness_of(:security_type) }
  end

  describe "relationships" do
    it "has many tickers" do
      security = create(:security)
      expect(security).to respond_to(:tickers)
    end
  end
end
