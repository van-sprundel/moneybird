# frozen_string_literal: true

module Moneybird::Resource
  class FinancialAccount
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      administration_id
      type
      name
      identifier
      currency
      provider
      active
      created_at
      updated_at
    )
  end
end


