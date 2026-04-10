# frozen_string_literal: true

module Moneybird
  module HttpError
    class TooManyRequests < Faraday::Error
    end
  end
end
