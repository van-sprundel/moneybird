# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Service::LedgerAccount do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:service) { Moneybird::Service::LedgerAccount.new(client, '123') }

  describe "#all" do
    before do
      stub_request(:get, 'https://moneybird.com/api/v2/123/ledger_accounts')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:ledger_accounts))
    end

    it "returns list of ledger_accounts" do
      ledger_accounts = service.all

      _(ledger_accounts.length).must_equal 3
      _(ledger_accounts.first.id).must_equal "143273834459432032"
    end
  end
end
