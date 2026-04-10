# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Resource::ExternalSalesInvoice do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:external_sales_invoice) { Moneybird::Resource::ExternalSalesInvoice.build(hash_response(:external_sales_invoices).first.merge('notes' => [hash_response(:note)])) }

  it "has a contact" do
    _(external_sales_invoice.contact).must_be_instance_of Moneybird::Resource::Contact
  end

  it "has details" do
    _(external_sales_invoice.details.first).must_be_instance_of Moneybird::Resource::Invoice::Details
  end

  it "has notes" do
    _(external_sales_invoice.notes.first).must_be_instance_of Moneybird::Resource::Generic::Note
  end

  it "has events" do
    _(external_sales_invoice.events.first).must_be_instance_of Moneybird::Resource::Generic::Event
  end
end
