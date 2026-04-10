# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Resource::Contact do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:contact) { Moneybird::Resource::Contact.build(hash_response(:contact)) }

  it "has events" do
    _(contact.events.first).must_be_instance_of Moneybird::Resource::Generic::Event
  end

  it "has custom_fields" do
    _(contact.custom_fields.first).must_be_instance_of Moneybird::Resource::CustomField
  end
end
