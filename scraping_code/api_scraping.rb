require 'open-uri'
require 'json'

urls = %w(
  https://scr-labo.com/sample/chap6-api.php?start=0&size=10000
)

all_products = []
urls.each do |url|
  sleep 1
  json = URI.open(url).read
  hash = JSON.parse(json)
  all_products << hash
end

p all_products