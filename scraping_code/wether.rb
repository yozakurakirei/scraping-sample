require 'uri'
require 'net/http'
require 'openssl'

url = URI("https://community-open-weather-map.p.rapidapi.com/find?q=london&cnt=0&mode=null&lon=0&type=link%2C%20accurate&lat=0&units=imperial%2C%20metric")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-key"] = '75ad7622dcmsh6ce96014c18c595p16ce61jsnf1227033998f'
request["x-rapidapi-host"] = 'community-open-weather-map.p.rapidapi.com'

response = http.request(request)
puts response.read_body