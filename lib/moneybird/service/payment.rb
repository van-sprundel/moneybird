# frozen_string_literal: true

module Moneybird::Service
  class Payment
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::FindAll
    include Moneybird::Traits::Save
    include Moneybird::Traits::Delete

    private

    def resource_class
      Moneybird::Resource::Invoice::Payment
    end

    def path
      "#{administration_id}/sales_invoices/#{options[:invoice_id]}/payments"
    end
  end
end