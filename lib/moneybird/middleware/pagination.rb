# frozen_string_literal: true

require 'link_header'

module Moneybird
  module Middleware
    class Pagination < Faraday::Middleware
      def on_complete(response)
        return unless response[:response_headers]
        link_header = response[:response_headers][:link]
        return unless link_header
        response[:response_headers][:pagination_links] = find_links(link_header)
      end

      private

      def find_links(link_header)
        Links.new.tap do |links|
          %w[prev next first last current].each do |page|
            links.public_send("#{page}=", find_link(link_header, page))
          end
        end
      end

      def find_link(header, rel)
        link = ::LinkHeader.parse(header).links.find { |l| l['rel'] == rel }
        link.to_a.first if link
      end
    end
  end
end
