# frozen_string_literal: true

module Moneybird::Service::Document
  class Receipt
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::Find
    include Moneybird::Traits::FindAll
    include Moneybird::Traits::Save
    include Moneybird::Traits::Delete
    include Moneybird::Traits::Synchronization

    private

    def resource_class
      Moneybird::Resource::Documents::Receipt
    end

    def path
      "#{administration_id}/documents/receipts"
    end
  end
end