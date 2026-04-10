# frozen_string_literal: true

module Moneybird::Service
  class FinancialAccount
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::FindAll

    private

    def resource_class
      Moneybird::Resource::FinancialAccount
    end

    def path
      "#{administration_id}/financial_accounts"
    end
  end
end