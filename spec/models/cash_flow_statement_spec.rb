require 'rails_helper'

RSpec.describe CashFlowStatement, type: :model do

  describe "relationships" do
    it "belongs to ticker" do
      cfs = create(:cash_flow_statement)
      expect(cfs).to respond_to(:ticker)
    end

    it "belongs to historical date" do
      cfs = create(:cash_flow_statement)
      expect(cfs).to respond_to(:historical_date)
    end
  end

end
