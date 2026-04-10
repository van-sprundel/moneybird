# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Service::Administration do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:service) { Moneybird::Service::Administration.new(client) }

  describe "#all" do
    before do
      stub_request(:get, 'https://moneybird.com/api/v2/administrations')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:administrations))
    end

    it "returns list of administrations" do
      administrations = service.all
      _(administrations.length).must_equal 1
      _(administrations.first.id).must_equal 123
    end

    it "finds an administration" do
      administration = service.find(123)
      _(administration.id).must_equal 123
    end
  end
end
