# frozen_string_literal: true

module Moneybird::Service
  class FinancialMutation
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::FindAll
    include Moneybird::Traits::Synchronization

    def link_booking(resource, booking)
      client.patch("#{resource_path(resource)}/link_booking", booking.to_json)
    end

    private

    def resource_class
      Moneybird::Resource::FinancialMutation
    end

    def path
      "#{administration_id}/financial_mutations"
    end
  end
end