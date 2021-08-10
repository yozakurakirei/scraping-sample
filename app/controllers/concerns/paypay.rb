# module Paypay
  require 'open-uri'
  require 'nokogiri'
  
#   url = "https://scr-labo.com/sample/chap2.php"
#   sleep 1
#   html = URI.open(url).read
#   doc = Nokogiri::HTML.parse(html)
#   product_elems = doc.css('div.card')
#   @products = product_elems.map do |product|
#     name  = product.at_css('div.card-header').text
#     desc  = product.at_css('div.card-body p').text
#     price = product.at_css('div.card-footer').text.delete("^0-9")
#     { name: name, desc: desc, price: price }
#   end
  
#   puts @products
  
# end

# module PaypayScrapesConcern
#   require 'open-uri'
#   require 'nokogiri'

#   def set_paypay_shops
#     url = 'https://paypay.ne.jp/notice/20200604/01/'

#     html = URI.open(url).read

#     doc = Nokogiri::HTML.parse(html, nil, charset)

#     @shops = []

#     doc.xpath('table').each do |node|
#       @shops << node.css('tr').inner_text
#     end

#     @shops = @shops.drop(1)
#     p @shops
#   end
# end

# sleep 1
# url = 'https://paypay.ne.jp/notice/20200604/01/'

# sleep 1 
# # html = URI.open(url).read
# doc = Nokogiri::HTML.parse(URI.open(url)) # 1行でOK
# @shops = doc.css('tbody')

# puts @shops