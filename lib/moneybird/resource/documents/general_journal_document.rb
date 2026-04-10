# frozen_string_literal: true

module Moneybird::Resource::Documents
  class GeneralJournalDocument
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
      general_journal_document_entries
    )
  end
end