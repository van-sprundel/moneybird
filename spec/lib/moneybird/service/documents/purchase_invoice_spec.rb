# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Service::Document::PurchaseInvoice do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:service) { Moneybird::Service::Document::PurchaseInvoice.new(client, '123') }

  describe "#all" do
    before do
      stub_request(:get, 'https://moneybird.com/api/v2/123/documents/purchase_invoices')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:purchase_invoices))
    end

    it "returns list of purchase_invoices" do
      purchase_invoices = service.all

      _(purchase_invoices.length).must_equal 1
      _(purchase_invoices.first.id).must_equal "151541225475802119"
    end
  end
end
