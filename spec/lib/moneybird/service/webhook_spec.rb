# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Service::Webhook do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:service) { Moneybird::Service::Webhook.new(client, '123') }

  describe "#all" do
    before do
      stub_request(:get, 'https://moneybird.com/api/v2/123/webhooks')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:webhooks))
    end

    it "returns list of webhooks" do
      webhooks = service.all

      _(webhooks.length).must_equal 1
      _(webhooks.first.url).must_equal "http://www.mocky.io/v2/5185415ba171ea3a00704eed"
    end
  end

  describe "#create" do
    before do
      stub_request(:post, 'https://moneybird.com/api/v2/123/webhooks')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:webhook))
    end

    it "creates a webhook" do
      webhook = service.create({url: "http://www.example.com/webhook"})

      _(webhook.id).must_equal hash_response(:webhook)['id']
    end
  end
end
