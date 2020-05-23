# frozen_string_literal: true

require 'hashids'

module TinyUtils
  module Uid
    ALPHABET = "abcdefghkmnpqrtuvwxyz1234567890"
    LENGTH = 8
    SALT = 'tinysalt'

    # Encode an integer ID
    # @param {int} id
    # @param {string} salt
    # @param {int} length
    # @param {string} alphabet
    # @returns {string}
    def encode(id, salt: SALT, length: LENGTH, alphabet: ALPHABET)
      Hashids.new(salt, length, alphabet).encode(id)
    end

    # Decode an encoded ID
    # @param {string} encoded_id
    # @param {string} salt
    # @param {int} length
    # @param {string} alphabet
    # @returns {int}
    def decode(encoded_id, salt: SALT, length: LENGTH, alphabet: ALPHABET)
      Hashids.new(salt, length, alphabet).decode(encoded_id).first
    end
  end
end
