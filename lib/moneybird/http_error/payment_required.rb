# frozen_string_literal: true

module Moneybird
  module HttpError
    class PaymentRequired < Faraday::Error
    end
  end
end
