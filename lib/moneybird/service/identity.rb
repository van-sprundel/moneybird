# frozen_string_literal: true

module Moneybird::Service
  class Identity
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::Find
    include Moneybird::Traits::FindAll
    include Moneybird::Traits::Save
    include Moneybird::Traits::Delete

    private

    def resource_class
      Moneybird::Resource::Identity
    end

    def path
      "#{administration_id}/identities"
    end
  end
end