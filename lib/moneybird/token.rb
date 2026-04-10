# frozen_string_literal: true

module Moneybird
  class Token
    attr_reader :access_token, :refresh_token, :token_type, :scope, :created_at

    def initialize(access_token:, refresh_token: nil, token_type: "bearer", scope: nil, created_at: nil)
      @access_token = access_token
      @refresh_token = refresh_token
      @token_type = token_type
      @scope = scope
      @created_at = created_at.is_a?(Numeric) ? Time.at(created_at) : created_at
    end

    # Create a Client from this token
    def client
      Client.new(access_token)
    end
  end
end
