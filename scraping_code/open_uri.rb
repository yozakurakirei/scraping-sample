require 'open-uri'

foo = OpenURI.open_uri('https://www.personal.co.jp/')
puts foo.base_uri
puts foo.charset
puts foo.content_encoding
puts foo.content_type
puts foo.last_modified
