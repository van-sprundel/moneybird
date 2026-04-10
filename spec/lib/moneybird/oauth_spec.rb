# frozen_string_literal: true

require "spec_helper"

describe Moneybird::OAuth do
  let(:oauth) do
    Moneybird::OAuth.new(
      client_id: "test_client_id",
      client_secret: "test_client_secret",
      redirect_uri: "https://example.com/callback"
    )
  end

  let(:token_response) do
    {
      access_token: "access_abc",
      refresh_token: "refresh_xyz",
      token_type: "bearer",
      scope: "sales_invoices",
      created_at: 1_700_000_000
    }.to_json
  end

  describe "constants" do
    it "defines AUTHORIZE_URL" do
      _(Moneybird::OAuth::AUTHORIZE_URL).must_equal "https://moneybird.com/oauth/authorize"
    end

    it "defines TOKEN_URL" do
      _(Moneybird::OAuth::TOKEN_URL).must_equal "https://moneybird.com/oauth/token"
    end

    it "defines all expected SCOPES" do
      expected = %w[sales_invoices documents estimates bank time_entries settings]
      _(Moneybird::OAuth::SCOPES).must_equal expected
    end
  end

  describe "#authorize_url" do
    it "builds the correct URL with default scope" do
      url = oauth.authorize_url
      uri = URI.parse(url)
      params = URI.decode_www_form(uri.query).to_h

      _(uri.host).must_equal "moneybird.com"
      _(uri.path).must_equal "/oauth/authorize"
      _(params["client_id"]).must_equal "test_client_id"
      _(params["redirect_uri"]).must_equal "https://example.com/callback"
      _(params["response_type"]).must_equal "code"
      _(params["scope"]).must_equal "sales_invoices"
    end

    it "accepts a custom scope as a string" do
      url = oauth.authorize_url(scope: "documents")
      params = URI.decode_www_form(URI.parse(url).query).to_h
      _(params["scope"]).must_equal "documents"
    end

    it "accepts a custom scope as an array and joins with space" do
      url = oauth.authorize_url(scope: %w[sales_invoices documents])
      params = URI.decode_www_form(URI.parse(url).query).to_h
      _(params["scope"]).must_equal "sales_invoices documents"
    end

    it "includes state when provided" do
      url = oauth.authorize_url(state: "random_csrf_token")
      params = URI.decode_www_form(URI.parse(url).query).to_h
      _(params["state"]).must_equal "random_csrf_token"
    end

    it "omits state when not provided" do
      url = oauth.authorize_url
      params = URI.decode_www_form(URI.parse(url).query).to_h
      _(params.key?("state")).must_equal false
    end
  end

  describe "#token" do
    it "exchanges the authorization code and returns a Token" do
      stub_request(:post, Moneybird::OAuth::TOKEN_URL)
        .with(body: {
          grant_type: "authorization_code",
          client_id: "test_client_id",
          client_secret: "test_client_secret",
          code: "auth_code_123",
          redirect_uri: "https://example.com/callback"
        })
        .to_return(status: 200, headers: { "Content-Type" => "application/json" }, body: token_response)

      result = oauth.token("auth_code_123")

      _(result).must_be_instance_of Moneybird::Token
      _(result.access_token).must_equal "access_abc"
      _(result.refresh_token).must_equal "refresh_xyz"
      _(result.token_type).must_equal "bearer"
      _(result.scope).must_equal "sales_invoices"
      _(result.created_at).must_equal Time.at(1_700_000_000)
    end
  end

  describe "#refresh" do
    it "refreshes the token and returns a new Token" do
      stub_request(:post, Moneybird::OAuth::TOKEN_URL)
        .with(body: {
          grant_type: "refresh_token",
          client_id: "test_client_id",
          client_secret: "test_client_secret",
          refresh_token: "old_refresh_token"
        })
        .to_return(status: 200, headers: { "Content-Type" => "application/json" }, body: token_response)

      result = oauth.refresh("old_refresh_token")

      _(result).must_be_instance_of Moneybird::Token
      _(result.access_token).must_equal "access_abc"
      _(result.refresh_token).must_equal "refresh_xyz"
    end
  end

  describe "error handling" do
    it "raises an error on non-200 response from the token endpoint" do
      stub_request(:post, Moneybird::OAuth::TOKEN_URL)
        .to_return(status: 401, headers: { "Content-Type" => "application/json" }, body: '{"error":"invalid_client"}')

      _(-> { oauth.token("bad_code") }).must_raise RuntimeError
    end

    it "includes the status code in the error message" do
      stub_request(:post, Moneybird::OAuth::TOKEN_URL)
        .to_return(status: 400, headers: { "Content-Type" => "application/json" }, body: '{"error":"invalid_grant"}')

      error = assert_raises(RuntimeError) { oauth.token("bad_code") }
      _(error.message).must_include "400"
    end
  end
end
