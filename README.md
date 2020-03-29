# TinyUtils 🔨

A tiny set of utility functions

## String
```rb
TinyUtils.concat_strings(['i', 'love', 'pizza', nil, ''], separator: "🍕")
# "i🍕love🍕pizza"

TinyUtils.random_hash
# kTszJnEcfJRJRXspvuMaqtTnWmrAuyhB

TinyUtils.datetime_to_hash(datetime: Time.current)
# oycRzVHWYkrXytRaZmLhFQskhyXoiNha
```

## Boolean
```rb
TinyUtils.cast_boolean("False")
TinyUtils.cast_boolean("0")
TinyUtils.cast_boolean("off")
# false
```

## Datetime
```rb
dt = TinyUtils.round_to_next_30_min_interval(Time.current)
dt.strftime("%I:%M %p")
# 5:30 PM
```

## Hash
```rb
h = TinyUtils.to_struct({ ok: "cool" })
h.ok
# "cool"

h = TinyUtils.filter_hash_by_keys({ ok: "cool", nice: "wow" }, [:nice])
# { nice: "wow" }
```

## RailsUrlHelper
```rb
TinyUtils.url_helper.home_path
TinyUtils.url_helper.home_url
```

## UID
```rb
TinyUtils.encode_id(1)
# a1b2cdef

TinyUtils.decode_id("a1b2cdef")
# 1
```
