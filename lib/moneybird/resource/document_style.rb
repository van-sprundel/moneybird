# frozen_string_literal: true

module Moneybird::Resource
  class DocumentStyle
    include Moneybird::Resource
    extend Moneybird::Resource::ClassMethods

    has_attributes %i(
      id
      administration_id
      name
      identity_id
      default
      logo_hash
      logo_container_full_width
      logo_display_width
      logo_position
      background_hash
      paper_size
      address_position
      font_size
      font_family
      print_on_stationery
      custom_css
      invoice_sender_address
      invoice_metadata_left
      invoice_metadata_right
      estimate_sender_address
      estimate_metadata_left
      estimate_metadata_right
      created_at
      updated_at
    )
  end
end