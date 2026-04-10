# frozen_string_literal: true

require 'uri'
require 'faraday'

module Moneybird
  class OAuth
    AUTHORIZE_URL = "https://moneybird.com/oauth/authorize"
    TOKEN_URL = "https://moneybird.com/oauth/token"

    SCOPES = %w[sales_invoices documents estimates bank time_entries settings].freeze

    attr_reader :client_id, :client_secret, :redirect_uri

    def initialize(client_id:, client_secret:, redirect_uri:)
      @client_id = client_id
      @client_secret = client_secret
      @redirect_uri = redirect_uri
    end

    # Returns the URL to redirect the user to for authorization
    def authorize_url(scope: nil, state: nil)
      scope = scope.is_a?(Array) ? scope.join(" ") : (scope || "sales_invoices")

      params = {
        client_id: client_id,
        redirect_uri: redirect_uri,
        response_type: "code",
        scope: scope
      }
      params[:state] = state if state

      uri = URI.parse(AUTHORIZE_URL)
      uri.query = URI.encode_www_form(params)
      uri.to_s
    end

    # Exchange authorization code for tokens
    # Returns a Token object
    def token(code)
      response = post_token(
        grant_type: "authorization_code",
        client_id: client_id,
        client_secret: client_secret,
        code: code,
        redirect_uri: redirect_uri
      )
      build_token(response)
    end

    # Refresh an existing token
    # Returns a new Token object
    def refresh(refresh_token)
      response = post_token(
        grant_type: "refresh_token",
        client_id: client_id,
        client_secret: client_secret,
        refresh_token: refresh_token
      )
      build_token(response)
    end

    private

    def post_token(params)
      connection = Faraday.new do |faraday|
        faraday.request :url_encoded
        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end

      response = connection.post(TOKEN_URL, params)

      unless response.success?
        raise "OAuth token request failed with status #{response.status}: #{response.body}"
      end

      response.body
    end

    def build_token(body)
      Token.new(
        access_token: body["access_token"],
        refresh_token: body["refresh_token"],
        token_type: body.fetch("token_type", "bearer"),
        scope: body["scope"],
        created_at: body["created_at"]
      )
    end
  end
end
