# frozen_string_literal: true

require "spec_helper"

describe Moneybird::Token do
  describe "#initialize" do
    it "stores all attributes" do
      token = Moneybird::Token.new(
        access_token: "abc123",
        refresh_token: "refresh456",
        token_type: "bearer",
        scope: "sales_invoices",
        created_at: nil
      )
      _(token.access_token).must_equal "abc123"
      _(token.refresh_token).must_equal "refresh456"
      _(token.token_type).must_equal "bearer"
      _(token.scope).must_equal "sales_invoices"
      _(token.created_at).must_be_nil
    end

    it "uses default token_type of bearer when not provided" do
      token = Moneybird::Token.new(access_token: "abc123")
      _(token.token_type).must_equal "bearer"
    end

    it "parses numeric created_at into a Time object" do
      timestamp = 1_700_000_000
      token = Moneybird::Token.new(access_token: "abc123", created_at: timestamp)
      _(token.created_at).must_be_instance_of Time
      _(token.created_at).must_equal Time.at(timestamp)
    end

    it "leaves non-numeric created_at as-is" do
      t = Time.now
      token = Moneybird::Token.new(access_token: "abc123", created_at: t)
      _(token.created_at).must_equal t
    end
  end

  describe "#client" do
    it "returns a Moneybird::Client initialized with the access_token" do
      token = Moneybird::Token.new(access_token: "my_token")
      client = token.client
      _(client).must_be_instance_of Moneybird::Client
      _(client.bearer_token).must_equal "my_token"
    end
  end
end
