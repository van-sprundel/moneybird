# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Service::Identity do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:service) { Moneybird::Service::Identity.new(client, '123') }

  describe "#all" do
    before do
      stub_request(:get, 'https://moneybird.com/api/v2/123/identities')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:identities))
    end

    it "returns list of identities" do
      identities = service.all

      _(identities.length).must_equal 1
      _(identities.first.company_name).must_equal "Parkietje B.V."
    end
  end
end
