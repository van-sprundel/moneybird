# frozen_string_literal: true

module Moneybird::Resource::Documents
  class GeneralDocument
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      administration_id
      contact
      contact_id
      reference
      date
      due_date
      entry_number
      state
      exchange_rate
      created_at
      updated_at
      version
      notes
      attachments
      events
    )
  end
end