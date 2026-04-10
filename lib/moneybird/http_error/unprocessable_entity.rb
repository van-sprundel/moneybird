# frozen_string_literal: true

module Moneybird
  module HttpError
    class UnprocessableEntity < Faraday::Error
    end
  end
end
