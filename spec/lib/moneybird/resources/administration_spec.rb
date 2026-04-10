# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Resource::Administration do
  let(:client) { Moneybird::Client.new('bearer token') }
  let(:administration) { Moneybird::Resource::Administration.new({id: 123}) }

  before do
    administration.client = client
  end

  it "has a list of sales invoices" do
    stub_request(:get, 'https://moneybird.com/api/v2/123/sales_invoices')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:sales_invoices))

    sales_invoices = administration.sales_invoices.all
    _(sales_invoices.length).must_equal 3
  end

  it "has a list of contacts" do
    stub_request(:get, 'https://moneybird.com/api/v2/123/contacts')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:contacts))

    contacts = administration.contacts.all
    _(contacts.length).must_equal 3
  end

  it "has a list of estimates" do
    stub_request(:get, 'https://moneybird.com/api/v2/123/estimates')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:estimates))

    estimates = administration.estimates.all
    _(estimates.length).must_equal 3
  end

  it "has a list of products" do
    stub_request(:get, 'https://moneybird.com/api/v2/123/products')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:products))

    products = administration.products.all
    _(products.length).must_equal 1
  end

  it "has a list of webhooks" do
    stub_request(:get, 'https://moneybird.com/api/v2/123/webhooks')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:webhooks))

    webhooks = administration.webhooks.all
    _(webhooks.length).must_equal 1
  end

  it "has a list of workflows" do
    stub_request(:get, 'https://moneybird.com/api/v2/123/workflows')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:workflows))

    workflows = administration.workflows.all
    _(workflows.length).must_equal 2
  end

  it "has a list of tax_rates" do
    stub_request(:get, 'https://moneybird.com/api/v2/123/tax_rates')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:tax_rates))

    tax_rates = administration.tax_rates.all
    _(tax_rates.length).must_equal 3
  end

  it "has a list of recurring_sales_invoices" do
    stub_request(:get, 'https://moneybird.com/api/v2/123/recurring_sales_invoices')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:recurring_sales_invoices))

    recurring_sales_invoices = administration.recurring_sales_invoices.all
    _(recurring_sales_invoices.length).must_equal 3
  end

  it "has a list of identities" do
    stub_request(:get, 'https://moneybird.com/api/v2/123/identities')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:identities))

    identities = administration.identities.all
    _(identities.length).must_equal 1
  end

  it "has a list of financial_mutations" do
    stub_request(:get, 'https://moneybird.com/api/v2/123/financial_mutations')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:financial_mutations))

    financial_mutations = administration.financial_mutations.all
    _(financial_mutations.length).must_equal 1
  end

  it "has a list of financial_accounts" do
    stub_request(:get, 'https://moneybird.com/api/v2/123/financial_accounts')
        .to_return(status: 200, headers: { content_type: "application/json" }, body: fixture_response(:financial_accounts))

    financial_accounts = administration.financial_accounts.all
    _(financial_accounts.length).must_equal 1
  end
end
