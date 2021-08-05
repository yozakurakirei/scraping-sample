require 'net/http'
require 'uri'
require 'nokogiri'

url = URI.parse('http://www.sweetsbox.jp/')
sleep 1
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = false
res = http.get(url)

html = res.body
doc = Nokogiri::HTML.parse(html)
breakfasts = doc.css("table tr td:nth-child(2)").map(&:text)
puts breakfasts
