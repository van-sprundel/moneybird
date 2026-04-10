# frozen_string_literal: true

module Moneybird::Resource::Generic
  class Note
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      administration_id
      entity_id
      entity_type
      user_id
      assignee_id
      todo
      note
      completed_at
      completed_by_id
      todo_type
      data
      created_at
      updated_at
    )
  end
end