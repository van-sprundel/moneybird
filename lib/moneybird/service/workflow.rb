# frozen_string_literal: true

module Moneybird::Service
  class Workflow
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::FindAll

    private

    def resource_class
      Moneybird::Resource::Workflow
    end

    def path
      "#{administration_id}/workflows"
    end
  end
end