# frozen_string_literal: true

module Moneybird
  module Traits
    module Delete
      def delete(resource)
        client.delete(resource_path(resource))
        true
      end
    end
  end
end
