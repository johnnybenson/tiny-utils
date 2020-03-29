# frozen_string_literal: true

module TinyUtils
  module Bool
    FALSE_VALUES = [nil, false, 0, "0", "", "f", "F", "false", "FALSE", "False", "off", "OFF", "Off", "no", "No", "NO"].to_set

    # Cast value to Boolean
    # @returns {boolean} TRUE for all values not in FALSE_VALUES set
    def cast_boolean(val)
      !FALSE_VALUES.include?(val)
    end
  end
end

