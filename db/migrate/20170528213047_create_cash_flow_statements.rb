class CreateCashFlowStatements < ActiveRecord::Migration[5.1]
  def change
    create_table :cash_flow_statements do |t|
      t.decimal :beginning_cash_position
      t.decimal :capital_expenditure
      t.decimal :cash_dividends_paid
      t.decimal :change_in_account_payable
      t.decimal :change_in_inventory
      t.decimal :change_in_other_working_capital
      t.decimal :change_in_payable
      t.decimal :change_in_payables_and_accrued_expense
      t.decimal :change_in_receivables
      t.decimal :change_in_working_capital
      t.decimal :change_in_cash
      t.decimal :common_stock_issuance
      t.decimal :common_stock_payments
      t.decimal :deferred_income_tax
      t.decimal :deferred_tax
      t.decimal :depreciation_amortization_depletion
      t.decimal :depreciation_and_amortization
      t.decimal :end_cash_position
      t.decimal :financing_cash_flow
      t.decimal :free_cash_flow
      t.decimal :income_tax_paid_supplemental_data
      t.decimal :interest_paid_supplemental_data
      t.decimal :investing_cash_flow
      t.decimal :issuance_of_capital_stock
      t.decimal :net_business_purchase_and_sale
      t.decimal :net_common_stock_issuance
      t.decimal :net_income
      t.decimal :net_income_from_continuing_operations
      t.decimal :net_intangibles_purchase_and_sale
      t.decimal :net_investment_purchase_and_sale
      t.decimal :net_issuance_payments_of_debt
      t.decimal :net_other_financing_charges
      t.decimal :net_other_investing_changes
      t.decimal :net_p_p_e_purchase_and_sale
      t.decimal :net_short_term_debt_issuance
      t.decimal :operating_cash_flow
      t.decimal :other_non_cash_items
      t.decimal :purchase_of_intangibles
      t.decimal :purchase_of_investment
      t.decimal :purchase_of_p_p_e
      t.decimal :repurchase_of_capital_stock
      t.decimal :sale_of_investment
      t.decimal :stock_based_compensation
    end

    add_reference :cash_flow_statements, :ticker, index: true, foreign_key: true
    add_reference :cash_flow_statements, :historical_date, index: true, foreign_key: true
  end
end
