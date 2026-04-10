# frozen_string_literal: true

require 'link_header'

module Moneybird
  module Middleware
    class Pagination < Faraday::Middleware
      class Links
        attr_accessor :first, :prev, :current, :next, :last
        alias previous prev
        alias prevous= prev=

        def last_page?
          !current.nil? && !last.nil? && current == last
        end
      end
    end
  end
end
