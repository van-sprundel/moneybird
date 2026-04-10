# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Service::Workflow do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:service) { Moneybird::Service::Workflow.new(client, '123') }

  describe "#all" do
    before do
      stub_request(:get, 'https://moneybird.com/api/v2/123/workflows')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:workflows))
    end

    it "returns list of workflows" do
      workflows = service.all

      _(workflows.length).must_equal 2
      _(workflows.first.id).must_equal "143273834676487280"
    end
  end
end
