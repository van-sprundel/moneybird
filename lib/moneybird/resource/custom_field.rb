# frozen_string_literal: true

module Moneybird::Resource
  class CustomField
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      administration_id
      created_at
      id
      name
      source
      updated_at
      value
    )
  end
end
