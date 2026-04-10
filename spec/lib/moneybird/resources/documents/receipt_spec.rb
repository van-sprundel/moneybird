# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Resource::Documents::Receipt do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:receipt) do
    Moneybird::Resource::Documents::Receipt.build(hash_response(:receipts).first
      .merge('notes' => [hash_response(:note)], 'payments' => [hash_response(:payment)]))
  end

  it "has a contact" do
    _(receipt.contact).must_be_instance_of Moneybird::Resource::Contact
  end

  it "has details" do
    _(receipt.details.first).must_be_instance_of Moneybird::Resource::Invoice::Details
  end

  it "has notes" do
    _(receipt.notes.first).must_be_instance_of Moneybird::Resource::Generic::Note
  end

  it "has events" do
    _(receipt.events.first).must_be_instance_of Moneybird::Resource::Generic::Event
  end

  it "has payments" do
    _(receipt.payments.first).must_be_instance_of Moneybird::Resource::Invoice::Payment
  end
end
