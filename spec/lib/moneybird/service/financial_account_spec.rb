# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Service::FinancialAccount do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:service) { Moneybird::Service::FinancialAccount.new(client, '123') }

  describe "#all" do
    before do
      stub_request(:get, 'https://moneybird.com/api/v2/123/financial_accounts')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:financial_accounts))
    end

    it "returns list of financial_accounts" do
      financial_accounts = service.all

      _(financial_accounts.length).must_equal 1
      _(financial_accounts.first.id).must_equal "143274045018735618"
    end
  end
end
