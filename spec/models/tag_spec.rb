require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "valid attributes" do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
  end

  describe "relationships" do
    it "has many ticker tags" do
      tag = create(:tag)
      expect(tag).to respond_to(:ticker_tags)
    end

    it "has many tickers" do
      tag = create(:tag)
      expect(tag).to respond_to(:tickers)
    end
  end
end