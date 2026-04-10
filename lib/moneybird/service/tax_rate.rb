# frozen_string_literal: true

module Moneybird::Service
  class TaxRate
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::FindAll

    private

    def resource_class
      Moneybird::Resource::TaxRate
    end

    def path
      "#{administration_id}/tax_rates"
    end
  end
end