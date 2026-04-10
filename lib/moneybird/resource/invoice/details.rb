# frozen_string_literal: true

module Moneybird::Resource::Invoice
  class Details
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      administration_id
      amount
      amount_decimal
      created_at
      description
      id
      ledger_account_id
      mandatory_tax_text
      period
      price
      product_id
      project_id
      row_order
      tax_rate_id
      tax_report_reference
      total_price_excl_tax_with_discount
      total_price_excl_tax_with_discount_base
      updated_at
    )
  end
end
