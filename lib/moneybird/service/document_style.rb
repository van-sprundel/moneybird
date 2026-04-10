# frozen_string_literal: true

module Moneybird::Service
  class DocumentStyle
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::FindAll

    private

    def resource_class
      Moneybird::Resource::DocumentStyle
    end

    def path
      "#{administration_id}/document_styles"
    end
  end
end