# frozen_string_literal: true

module Moneybird
  module Traits
    module Service
      def build(attributes)
        resource_class.build attributes.merge(client: client)
      end

      def resource_path(resource)
        [path, resource.path].join('')
      end
    end
  end
end