# frozen_string_literal: true

require_relative 'tiny_utils/bool'
require_relative 'tiny_utils/hash'
require_relative 'tiny_utils/datetime'
require_relative 'tiny_utils/rails_url_helper'
require_relative 'tiny_utils/string'
require_relative 'tiny_utils/uid'

module TinyUtils
  prepend TinyUtils::Bool
  prepend TinyUtils::Hash
  prepend TinyUtils::Datetime
  prepend TinyUtils::RailsUrlHelper
  prepend TinyUtils::String
  prepend TinyUtils::Uid

  extend self
end
