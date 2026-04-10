# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Service::FinancialMutation do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:service) { Moneybird::Service::FinancialMutation.new(client, '123') }

  describe "#all" do
    before do
      stub_request(:get, 'https://moneybird.com/api/v2/123/financial_mutations')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:financial_mutations))
    end

    it "returns list of financial_mutations" do
      financial_mutations = service.all

      _(financial_mutations.length).must_equal 1
      _(financial_mutations.first.id).must_equal "143274048181240838"
    end
  end

  describe "#link_booking" do
    before do
      stub_request(:patch, 'https://moneybird.com/api/v2/123/financial_mutations/456/link_booking')
        .to_return(status: 200)
    end
    let(:financial_mutation) { Moneybird::Resource::FinancialMutation.new(client: client, id: '456') }

    it "will link the booking" do
      service.link_booking(financial_mutation, {booking_type: "LedgerAccount", booking_id: '249211343214351830', price_base: 49.95})

      assert_requested(:patch, "https://moneybird.com/api/v2/123/financial_mutations/456/link_booking", times: 1) do |req|
        parsed_body = JSON.parse(req.body)
        _(parsed_body["booking_type"]).must_equal "LedgerAccount"
        _(parsed_body["booking_id"]).must_equal "249211343214351830"
        _(parsed_body["price_base"]).must_equal 49.95
      end
    end
  end
end

