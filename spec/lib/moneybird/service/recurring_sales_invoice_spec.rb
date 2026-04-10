# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Service::RecurringSalesInvoice do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:service) { Moneybird::Service::RecurringSalesInvoice.new(client, '123') }

  describe "#all" do
    before do
      stub_request(:get, 'https://moneybird.com/api/v2/123/recurring_sales_invoices')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:recurring_sales_invoices))
    end

    it "returns list of recurring_sales_invoices" do
      recurring_sales_invoices = service.all

      _(recurring_sales_invoices.length).must_equal 3
      _(recurring_sales_invoices.first.id).must_equal "194733557789230097"
    end
  end
end
