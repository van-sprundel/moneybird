# frozen_string_literal: true

module Moneybird::Resource
  class Contact
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      address1
      address2
      administration_id
      archived
      attention
      bank_account
      chamber_of_commerce
      city
      company_name
      contact_people
      country
      created_at
      credit_card_number
      credit_card_reference
      credit_card_type
      custom_fields
      customer_id
      delivery_method
      email
      email_ubl
      estimate_workflow_id
      events
      firstname
      id
      invoice_workflow_id
      lastname
      moneybird_payments_mandate
      notes
      phone
      sales_invoices_url
      send_estimates_to_attention
      send_estimates_to_email
      send_invoices_to_attention
      send_invoices_to_email
      send_method
      sepa_active
      sepa_bic
      sepa_iban
      sepa_iban_account_name
      sepa_mandate_date
      sepa_mandate_id
      sepa_sequence_type
      si_identifier
      si_identifier_type
      tax_number
      tax_number_valid
      tax_number_validated_at
      updated_at
      version
      zipcode
    )

    def notes=(notes)
      @notes = notes.map{ |note| Moneybird::Resource::Generic::Note.build(note) }
    end

    def events=(events)
      @events = events.map{ |event| Moneybird::Resource::Generic::Event.build(event) }
    end

    def custom_fields=(custom_fields)
      @custom_fields = custom_fields.map { |custom_field| Moneybird::Resource::CustomField.build(custom_field) }
    end
  end
end


