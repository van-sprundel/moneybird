# frozen_string_literal: true

module Moneybird
  module Traits
    module Save
      def save(resource)
        response =
          if resource.persisted?
            client.patch(resource_path(resource), resource.to_json)
          else
            client.post(resource_path(resource), resource.to_json)
          end
        resource.attributes = response
        resource
      end

      def create(attributes)
        build(attributes).tap do |resource|
          save(resource)
        end
      end

      alias update create
    end
  end
end
