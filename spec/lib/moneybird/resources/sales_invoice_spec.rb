# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Resource::SalesInvoice do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:sales_invoice) { Moneybird::Resource::SalesInvoice.build(hash_response(:sales_invoices).first.merge('notes' => [hash_response(:note)])) }

  it "has a contact" do
    _(sales_invoice.contact).must_be_instance_of Moneybird::Resource::Contact
  end

  it "has details" do
    _(sales_invoice.details.first).must_be_instance_of Moneybird::Resource::Invoice::Details
  end

  it "has notes" do
    _(sales_invoice.notes.first).must_be_instance_of Moneybird::Resource::Generic::Note
  end

  it "has events" do
    _(sales_invoice.events.first).must_be_instance_of Moneybird::Resource::Generic::Event
  end

  it "has custom_fields" do
    _(sales_invoice.custom_fields.first).must_be_instance_of Moneybird::Resource::CustomField
  end
end
