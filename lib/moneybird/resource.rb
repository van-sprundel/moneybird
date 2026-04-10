# frozen_string_literal: true

module Moneybird
  module Resource
    attr_accessor :errors, :client

    def initialize(attributes)
      self.attributes = attributes
    end

    def persisted?
      !!id
    end

    def path
      persisted? ? "/#{id}" : ""
    end

    def attributes=(attributes)
      @attributes = attributes
      self.client ||= attributes[:client]
      attributes.each do |attribute, value|
        if respond_to?(writer = attribute.to_s + '=')
          send(writer, value)
        else
          self.class.logger.warn "#{self.class} does not have an `#{attribute}' attribute"
        end
      end
    end

    def attributes
      self.class.attributes.inject({}) do |attributes, attribute|
        value = send(attribute)
        if !value.nil?
          if value.is_a?(Array) && value.first.respond_to?(:attributes)
            attributes["#{attribute}_attributes"] = value.map { |item| item.attributes }
          elsif value.respond_to?(:attributes)
            attributes["#{attribute}_attributes"] = value.attributes
          else
            unless self.class.nillable_attributes && self.class.nillable_attributes.include?(attribute)
              attributes[attribute] = value
            end
          end
        end; attributes
      end
    end

    def to_json
      JSON.generate({self.class.resource => attributes.as_json})
    end

    module ClassMethods
      attr_reader :attributes, :nillable_attributes
      attr_writer :logger

      def build(attributes)
        new(attributes)
      end

      def logger
        @logger ||= begin
          Logger.new(STDOUT)
        end
      end

      def resource
        self.name.split('::').last.underscore
      end

      def has_attributes(attributes)
        attr_accessor(*@attributes = attributes)
      end

      def has_nillable_attributes(attributes)
        @nillable_attributes = attributes
      end

      def has_boolean_attributes(attributes)
        attributes.each do |attribute|
          define_method(attribute) do
            input = instance_variable_get('@' + attribute)
            if input.kind_of?(String)
              if input == 'true'
                true
              elsif input == 'false'
                false
              else
                nil
              end
            else
              input
            end
          end
        end
      end

      def has_integer_attributes(attributes)
        attributes.each do |attribute|
          define_method(attribute) do
            input = instance_variable_get('@' + attribute)
            if input.kind_of?(String)
              input.to_i
            else
              input
            end
          end
        end
      end

      def has_datetime_attributes(attributes)
        attributes.each do |attribute|
          define_method(attribute) do
            input = instance_variable_get('@' + attribute)
            if input.kind_of?(Time)
              input
            elsif input.kind_of?(Date)
              input.to_time
            elsif input.kind_of?(String)
              input.strip == '' ? nil : Time.parse(input)
            end
          end
        end
      end
    end
  end
end
