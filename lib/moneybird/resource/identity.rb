# frozen_string_literal: true

module Moneybird::Resource
  class Identity
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      administration_id
      company_name
      city
      country
      zipcode
      address1
      address2
      email
      phone
      bank_account_name
      bank_account_number
      bank_account_bic
      custom_fields
      created_at
      updated_at
    )
  end

  def custom_fields=(custom_fields)
    @custom_fields = custom_fields.map { |custom_field| Moneybird::Resource::CustomField.build(custom_field) }
  end
end
