# frozen_string_literal: true

module Moneybird::Resource
  class RecurringSalesInvoice
    include Moneybird::Resource

    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      administration_id
      contact_id
      custom_fields
      workflow_id
      start_date
      invoice_date
      last_date
      active
      payment_conditions
      reference
      language
      currency
      discount
      first_due_interval
      auto_send
      sending_scheduled_at
      sending_scheduled_user_id
      frequency_type
      frequency
      created_at
      updated_at
      prices_are_incl_tax
      total_price_excl_tax
      total_price_excl_tax_base
      total_price_incl_tax
      total_price_incl_tax_base
      attachments
    )

    @attributes += %i(contact details events notes)
    attr_reader :contact, :details, :events, :notes

    def notes=(notes)
      @notes = notes.map{ |note| Moneybird::Resource::Generic::Note.build(note) }
    end

    def contact=(attributes)
      @contact = Moneybird::Resource::Contact.build(attributes)
    end

    def details=(line_items)
      @details = line_items.map{ |line_item| Moneybird::Resource::Invoice::Details.build(line_item) }
    end

    def events=(events)
      @events = events.map{ |event| Moneybird::Resource::Generic::Event.build(event) }
    end
  end
end



