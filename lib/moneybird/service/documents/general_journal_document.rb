# frozen_string_literal: true

module Moneybird::Service::Document
  class GeneralJournalDocument
    include Moneybird::Traits::AdministrationService
    include Moneybird::Traits::Service
    include Moneybird::Traits::Find
    include Moneybird::Traits::FindAll
    include Moneybird::Traits::Save
    include Moneybird::Traits::Delete
    include Moneybird::Traits::Synchronization

    private

    def resource_class
      Moneybird::Resource::Documents::GeneralJournalDocument
    end

    def path
      "#{administration_id}/documents/general_journal_documents"
    end
  end
end