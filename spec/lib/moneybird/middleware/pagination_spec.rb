# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Middleware::Pagination do
  let(:client) { Moneybird::Client.new("bearer token") }
  let(:pagination_links_header) { client.http.get('/api/v2/administrations', per_page: 10)[:pagination_links] }

  before do
    stub_request(:get, "https://moneybird.com/api/v2/administrations?per_page=10").
      to_return(
        status: 200,
        body: fixture_response(:administrations),
        headers: {
          content_type: "application/json",
          'Link' => '<https://moneybird.com/api/v2/administrations.json?page=3>; rel="next", <https://moneybird.com/api/v2/administrations.json?page=1>; rel="prev"'
        }
      )
  end

  it 'returns a links object' do
    _(pagination_links_header).must_be_instance_of Moneybird::Middleware::Pagination::Links
  end

  it 'returns a next url' do
    _(pagination_links_header.next).must_equal 'https://moneybird.com/api/v2/administrations.json?page=3'
  end

  it 'returns a prev url' do
    _(pagination_links_header.prev).must_equal 'https://moneybird.com/api/v2/administrations.json?page=1'
  end

  it 'returns a previous url' do
    _(pagination_links_header.previous).must_equal 'https://moneybird.com/api/v2/administrations.json?page=1'
  end
end
