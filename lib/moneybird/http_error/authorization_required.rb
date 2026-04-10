# frozen_string_literal: true

module Moneybird
  module HttpError
    class AuthorizationRequired < Faraday::Error
    end
  end
end
