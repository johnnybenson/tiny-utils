# frozen_string_literal: true

module TinyUtils
  module Array
    # Average numbers in an array
    # @return Float
    def average_array_values(arr)
      arr.sum(0.0) / arr.size
    end
  end
end
