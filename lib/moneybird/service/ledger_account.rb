# frozen_string_literal: true

module Moneybird::Service
  class LedgerAccount
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::Find
    include Moneybird::Traits::FindAll
    include Moneybird::Traits::Save
    include Moneybird::Traits::Delete

    private

    def resource_class
      Moneybird::Resource::LedgerAccount
    end

    def path
      "#{administration_id}/ledger_accounts"
    end
  end
end