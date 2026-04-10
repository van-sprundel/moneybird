# frozen_string_literal: true

module Moneybird::Service
  class CustomField
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::FindAll

    private

    def resource_class
      Moneybird::Resource::CustomField
    end

    def path
      "#{administration_id}/custom_fields"
    end
  end
end
