require 'rails_helper'

RSpec.describe TickerTag, type: :model do
  describe "relationships" do
    it "belongs to ticker" do
      tt = create(:ticker_tag)
      expect(tt).to respond_to(:ticker)
    end

    it "belongs to tag" do
      tt = create(:ticker_tag)
      expect(tt).to respond_to(:tag)
    end
  end
end
