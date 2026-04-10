# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Service::CustomField do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:service) { Moneybird::Service::CustomField.new(client, '123') }

  describe "#all" do
    before do
      stub_request(:get, 'https://moneybird.com/api/v2/123/custom_fields')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:custom_fields))
    end

    it "returns list of custom_fields" do
      custom_fields = service.all

      _(custom_fields.length).must_equal 2
      _(custom_fields.first.name).must_equal "Default"
      _(custom_fields.first.source).must_equal "sales_invoice"
    end
  end
end
