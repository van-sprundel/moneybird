# frozen_string_literal: true

module Moneybird::Service
  class Contact
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::Find
    include Moneybird::Traits::FindAll
    include Moneybird::Traits::Save
    include Moneybird::Traits::Delete
    include Moneybird::Traits::Synchronization

    def find_by_customer_id(customer_id)
      build client.get("#{path}/customer_id/#{customer_id}")
    end

    private

    def resource_class
      Moneybird::Resource::Contact
    end

    def path
      "#{administration_id}/contacts"
    end
  end
end