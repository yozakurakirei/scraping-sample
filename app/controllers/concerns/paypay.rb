# module PaypaysConcern
#   require 'nokogiri'
#   require 'open-uri'

#   def paypay_shops
#     url = 'https://paypay.ne.jp/notice/20200604/01/'

#     charset = nil
#     html = opne(url) do |f|
#       charset = f.charset
#       f.read
#     end

#     doc = Nokogiri::HTML.parse(html, nil, charset)

#     @shops = []

#     doc.xpath('//div[@class="article__contents post"]').css('tr').each do |shop|
#       @shops << shop.css("td[1]").text
#     end

#     @shops = @shops.drop(1)
#     puts @shops

#   end
# end

module PaypayScrapesConcern
  require 'open-uri'
  require 'nokogiri'

  url = 'https://paypay.ne.jp/notice/20200604/01/'

  sleep 1

  html = URI.open(url).read
  doc = Nokogiri::HTML.parse(html)
  page = doc.css("h1")

  puts page.text
end