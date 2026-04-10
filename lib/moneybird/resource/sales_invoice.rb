# frozen_string_literal: true

module Moneybird::Resource
  class SalesInvoice
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      administration_id
      attachments
      contact
      contact_id
      contact_person
      contact_person_id
      created_at
      currency
      custom_fields
      details
      discount
      document_style_id
      draft_id
      due_date
      events
      id
      identity_id
      invoice_date
      invoice_id
      invoice_sequence_id
      language
      marked_dubious_on
      marked_uncollectible_on
      next_reminder
      notes
      original_estimate_id
      original_sales_invoice_id
      paid_at
      paused
      payment_conditions
      payment_reference
      payment_url
      payments
      prices_are_incl_tax
      public_view_code
      public_view_code_expires_at
      recurring_sales_invoice_id
      reference
      reminder_count
      sent_at
      short_payment_reference
      state
      tax_totals
      total_discount
      total_paid
      total_price_excl_tax
      total_price_excl_tax_base
      total_price_incl_tax
      total_price_incl_tax_base
      total_unpaid
      total_unpaid_base
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

    def send_invoice(options = {})
      invoice_service = Moneybird::Service::SalesInvoice.new(client, administration_id)
      invoice_service.send_invoice(self, options)
    end

    def mark_as_uncollectible(options = {})
      invoice_service = Moneybird::Service::SalesInvoice.new(client, administration_id)
      invoice_service.mark_as_uncollectible(self, options)
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

    def custom_fields=(custom_fields)
      @custom_fields = custom_fields.map { |custom_field| Moneybird::Resource::CustomField.build(custom_field) }
    end
  end
end
