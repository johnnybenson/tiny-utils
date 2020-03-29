# frozen_string_literal: true

module TinyUtils
  module Hash
    # Struct allows for attribute-style access of hash keys
    # @return Struct
    def to_struct(hash)
      Struct.new(*hash.keys).new(*hash.values)
    end

    # Filter Hash by keys
    # @return Hash
    def filter_hash_by_keys(hash, keys)
      hash.select { |k, v| keys.include?(k) }
    end
  end
end
