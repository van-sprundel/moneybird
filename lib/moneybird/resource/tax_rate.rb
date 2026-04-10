# frozen_string_literal: true

module Moneybird::Resource
  class TaxRate
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      administration_id
      name
      percentage
      tax_rate_type
      show_tax
      active
      country
      created_at
      updated_at
    )
  end
end
