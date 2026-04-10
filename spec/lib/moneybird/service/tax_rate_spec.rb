# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Service::TaxRate do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:service) { Moneybird::Service::TaxRate.new(client, '123') }

  describe "#all" do
    before do
      stub_request(:get, 'https://moneybird.com/api/v2/123/tax_rates')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:tax_rates))
    end

    it "returns list of tax_rates" do
      tax_rates = service.all

      _(tax_rates.length).must_equal 3
      _(tax_rates.first.id).must_equal "143273834510812265"
    end
  end
end
