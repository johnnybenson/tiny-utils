# frozen_string_literal: true

module TinyUtils
  module String
    # Concatenates an array of strings by a separator.
    # nil or blank values are excluded.
    # Can provide an optional separator string.
    def concat_strings(strings, separator: " ")
      strings.compact.delete_if(&:blank?).join(separator)
    end

    # Random Hash used for maintaining distinctly separate anonymized users
    # within an application with uniqueness constraints
    # SecureRandom.urlsafe_base64
    # http://ruby-doc.org/stdlib-1.9.2/libdoc/securerandom/rdoc/SecureRandom.html#method-c-base64
    def random_hash
      "#{SecureRandom.urlsafe_base64(32)}-#{timestamp_hash}"
    end

    # MD5 Hash of a Datetime
    # Digest::MD5.new
    # https://ruby-doc.org/stdlib-2.4.0/libdoc/digest/rdoc/Digest/MD5.html
    def timestamp_hash(datetime: Time.current)
      Digest::MD5.new.update(datetime.to_f.to_s).hexdigest
    end
  end
end
