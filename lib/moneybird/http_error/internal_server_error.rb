# frozen_string_literal: true

module Moneybird
  module HttpError
    class InternalServerError < Faraday::Error
    end
  end
end
