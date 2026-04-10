# frozen_string_literal: true

module Moneybird
  module Traits
    module MarkAsUncollectible
      def mark_as_uncollectible_path(resource)
        [path, resource.path, '/mark_as_uncollectible'].join('')
      end

      def mark_as_uncollectible(resource, options = {})
        response = client.patch(mark_as_uncollectible_path(resource), options.to_json)
        resource.attributes = response
        resource
      end
    end
  end
end
