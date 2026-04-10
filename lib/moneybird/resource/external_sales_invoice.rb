# frozen_string_literal: true

module Moneybird::Resource
  class ExternalSalesInvoice
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      administration_id
      contact_id
      contact
      date
      state
      due_date
      reference
      entry_number
      origin
      source
      source_url
      currency
      paid_at
      created_at
      updated_at
      version
      details
      payments
      notes
      attachments
      events
      tax_totals
      total_paid
      total_unpaid
      total_unpaid_base
      prices_are_incl_tax
      total_price_excl_tax
      total_price_excl_tax_base
      total_price_incl_tax
      total_price_incl_tax_base
    )

    def notes=(notes)
      @notes = notes.map{ |note| Moneybird::Resource::Generic::Note.build(note) }
    end

    def contact=(attributes)
      @contact = Moneybird::Resource::Contact.build(attributes)
    end

    def payments=(payments)
      payment_data = payments.map{ |payment| Moneybird::Resource::Invoice::Payment.build(payment) }
      @payments = Moneybird::Service::Payment.new(client, administration_id, preloaded_data: payment_data, invoice_id: id)
    end

    def details=(line_items)
      @details = line_items.map{ |line_item| Moneybird::Resource::Invoice::Details.build(line_item) }
    end

    def events=(events)
      @events = events.map{ |event| Moneybird::Resource::Generic::Event.build(event) }
    end
  end
end
