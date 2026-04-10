# frozen_string_literal: true

module Moneybird::Resource
  class Product
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      description
      price
      tax_rate_id
      ledger_account_id
      created_at
      updated_at
      administration_id
    )
  end
end


