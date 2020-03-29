# frozen_string_literal: true

module TinyUtils
  module Datetime
    # 5:01 -> 5:30 | 5:20 -> 6:30 | 5:15 -> 6:00
    def round_to_next_30_min_interval(datetime_obj)
      Time.at((datetime_obj.to_time.to_i / 1800.0).round * 1800).to_datetime
    end
  end
end
