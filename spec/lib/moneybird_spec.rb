# frozen_string_literal: true

require 'spec_helper'

describe Moneybird do
  it 'has a version number' do
    _(Moneybird::VERSION).wont_be_nil
  end
end
