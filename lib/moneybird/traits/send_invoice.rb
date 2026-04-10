# frozen_string_literal: true

module Moneybird
  module Traits
    module SendInvoice
      def send_invoice_path(resource)
        [path, resource.path, '/send_invoice'].join('')
      end

      def send_invoice(resource, options = {})
        response = client.patch(send_invoice_path(resource), options.to_json)
        resource.attributes = response
        resource
      end
    end
  end
end
