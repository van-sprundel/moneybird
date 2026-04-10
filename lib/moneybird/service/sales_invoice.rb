# frozen_string_literal: true

module Moneybird::Service
  class SalesInvoice
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::Find
    include Moneybird::Traits::FindAll
    include Moneybird::Traits::Save
    include Moneybird::Traits::Delete
    include Moneybird::Traits::Synchronization
    include Moneybird::Traits::DownloadPdf
    include Moneybird::Traits::SendInvoice
    include Moneybird::Traits::MarkAsUncollectible

    private

    def resource_class
      Moneybird::Resource::SalesInvoice
    end

    def path
      "#{administration_id}/sales_invoices"
    end
  end
end
