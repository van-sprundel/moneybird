# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Middleware::ErrorHandling do
  let(:client) { Moneybird::Client.new("bearer token") }

  # This are all possible http status codes
  STATUSSES = [100, 101, 102, 200, 201, 202, 203, 204, 205, 206, 207, 208, 226, 300, 301, 302, 303, 304, 305, 307, 308, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 421, 422, 423, 424, 426, 428, 429, 431, 500, 501, 502, 503, 504, 505, 506, 507, 508, 510, 511].freeze

  STATUSSES.each do |status|
    describe "with status #{status}" do
      before do
        stub_request(:get, "https://moneybird.com/api/v2/#{status}")
          .to_return(status: status)
      end

      if Moneybird::Middleware::ErrorHandling::ERROR_MAP.key? status
        it "raises #{Moneybird::Middleware::ErrorHandling::ERROR_MAP[status]}" do
          assert_raises Moneybird::Middleware::ErrorHandling::ERROR_MAP[status] do
            client.get("#{status}")
          end
        end
      else
        it 'does not raise error' do
          client.get("#{status}")
        end
      end
    end
  end
end
