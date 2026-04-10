# frozen_string_literal: true

module Moneybird
  module Traits
    module FindAll
      def all(params = {})
        each(params).to_a
      end

      def each_page(params = {})
        return enum_for(:each_page, params) unless block_given?
        client.get_each_page(path, params).map do |resources|
          yield resources.map { |resource| build resource }
        end
      end

      def each(params = {})
        return enum_for(:each, params) unless block_given?
        if preloaded_data
          preloaded_data.each do |data|
            yield data
          end
        else
          each_page(params).each do |resources|
            resources.each do |resource|
              yield resource
            end
          end
        end
      end

      def first_page(params = {})
        client.get(path, params).map do |resource|
          build resource
        end
      end

      def first(params = {})
        params = { per_page: 1 }.merge params
        build client.get(path, params).first
      end

      def map(params = {})
        return enum_for(:map, params) unless block_given?
        each(params).map do |resource|
          yield resource
        end
      end
    end
  end
end
