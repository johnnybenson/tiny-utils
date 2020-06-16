# frozen_string_literal: true

require 'rails'
require 'singleton'

module TinyUtils
  module RailsUrlHelper
    # URL Helper Container Class (Performance)
    # @link https://travisofthenorth.com/blog/2017/12/27/rails-urlhelpers
    class << self
      include Singleton
      include Rails.application.routes.url_helpers if Rails.application.present?
    end

    # TinyUtils.url_helper.some_path(params...)
    def url_helper
      TinyUtils::RailsUrlHelper.instance
    end
  end
end

