# frozen_string_literal: true

module Moneybird
  module Traits
    module Synchronization
      def synchronization(params = {})
        client.get("#{path}/synchronization", params).map do |resource|
          Moneybird::Resource::Synchronization.new resource
        end
      end
    end
  end
end
