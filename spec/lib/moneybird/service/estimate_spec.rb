# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Service::Estimate do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:service) { Moneybird::Service::Estimate.new(client, '123') }

  describe "#all" do
    before do
      stub_request(:get, 'https://moneybird.com/api/v2/123/estimates')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:estimates))
    end

    it "returns list of estimates" do
      estimates = service.all

      _(estimates.length).must_equal 3
      _(estimates.first.id).must_equal "194733527152985421"
    end
  end
end
