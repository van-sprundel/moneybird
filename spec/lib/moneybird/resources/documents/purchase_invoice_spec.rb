# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Resource::Documents::PurchaseInvoice do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:purchase_invoice) do
    Moneybird::Resource::Documents::PurchaseInvoice.build(hash_response(:purchase_invoices).first
      .merge('notes' => [hash_response(:note)], 'payments' => [hash_response(:payment)]))
  end

  it "has a contact" do
    _(purchase_invoice.contact).must_be_instance_of Moneybird::Resource::Contact
  end

  it "has details" do
    _(purchase_invoice.details.first).must_be_instance_of Moneybird::Resource::Invoice::Details
  end

  it "has notes" do
    _(purchase_invoice.notes.first).must_be_instance_of Moneybird::Resource::Generic::Note
  end

  it "has events" do
    _(purchase_invoice.events.first).must_be_instance_of Moneybird::Resource::Generic::Event
  end

  it "has payments" do
    _(purchase_invoice.payments.first).must_be_instance_of Moneybird::Resource::Invoice::Payment
  end
end
