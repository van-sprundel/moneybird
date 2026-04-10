# frozen_string_literal: true

module Moneybird::Resource
  class Estimate
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      accepted_at
      administration_id
      archived_at
      attachments
      contact
      contact_id
      created_at
      currency
      custom_fields
      details
      discount
      document_style_id
      draft_id
      due_date
      estimate_date
      estimate_id
      events
      exchange_rate
      id
      identity_id
      language
      notes
      original_estimate_id
      post_text
      pre_text
      reference
      rejected_at
      sent_at
      show_tax
      sign_online
      state
      tax_totals
      total_discount
      total_price_excl_tax
      total_price_excl_tax_base
      total_price_incl_tax
      total_price_incl_tax_base
      updated_at
      url
      version
      workflow_id
    )

    def notes=(notes)
      @notes = notes.map{ |note| Moneybird::Resource::Generic::Note.build(note) }
    end

    def contact=(attributes)
      @contact = Moneybird::Resource::Contact.build(attributes)
    end

    def details=(line_items)
      @details = line_items.map{ |line_item| Moneybird::Resource::Invoice::Details.build(line_item) }
    end
  end
end
