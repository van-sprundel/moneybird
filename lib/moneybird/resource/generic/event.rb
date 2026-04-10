# frozen_string_literal: true

module Moneybird::Resource::Generic
  class Event
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      user_id
      administration_id
      action
      link_entity_id
      link_entity_type
      data
      created_at
      updated_at
    )
  end
end