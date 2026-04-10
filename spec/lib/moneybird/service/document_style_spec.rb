# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Service::DocumentStyle do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:service) { Moneybird::Service::DocumentStyle.new(client, '123') }

  describe "#all" do
    before do
      stub_request(:get, 'https://moneybird.com/api/v2/123/document_styles')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:document_styles))
    end

    it "returns list of document_styles" do
      document_styles = service.all

      _(document_styles.length).must_equal 1
      _(document_styles.first.name).must_equal "Default"
    end
  end
end
