# frozen_string_literal: true

module Moneybird
  module Resource
    class Synchronization
      include Moneybird::Resource
      extend Moneybird::Resource::ClassMethods

      has_attributes %i(
        id
        version
      )
    end
  end
end
