# frozen_string_literal: true

module Moneybird
  module Traits
    module AdministrationService
      attr_reader :client, :administration_id, :preloaded_data, :options

      def initialize(client, administration_id, options = {})
        @client = client
        @administration_id = administration_id
        @preloaded_data = options.delete(:preloaded_data)
        @options = options
      end
    end
  end
end