# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Service::ExternalSalesInvoice do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:service) { Moneybird::Service::ExternalSalesInvoice.new(client, '123') }

  describe "#all" do
    before do
      stub_request(:get, 'https://moneybird.com/api/v2/123/external_sales_invoices')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:external_sales_invoices))
    end

    it "returns list of external_sales_invoices" do
      external_sales_invoices = service.all

      _(external_sales_invoices.length).must_equal 1
      _(external_sales_invoices.first.id).must_equal "283632324719936675"
    end
  end

  describe "#save" do
    let(:id) { '1' }
    let(:attributes) { { id: id, reference: 'FooBar' } }

    it "creates when not persisted" do
      stub_request(:post, "https://moneybird.com/api/v2/123/external_sales_invoices")
        .to_return(status: 201, headers: { content_type: "application/json" }, body: fixture_response(:external_sales_invoice))
      attributes.delete(:id)

      resource = service.build(attributes)
      _(service.save(resource)).must_equal resource
    end

    it "updates when persisted" do
      stub_request(:patch, "https://moneybird.com/api/v2/123/external_sales_invoices/#{id}")
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:external_sales_invoice))

      resource = service.build(attributes)
      _(service.save(resource)).must_equal resource
    end
  end

end
