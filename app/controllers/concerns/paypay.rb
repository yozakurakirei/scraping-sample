module Paypay
  require 'open-uri'
  require 'nokogiri'
  
  url = "https://scr-labo.com/sample/chap2.php"
  sleep 1
  html = URI.open(url).read
  doc = Nokogiri::HTML.parse(html)
  product_elems = doc.css('div.card')
  @products = product_elems.map do |product|
    name  = product.at_css('div.card-header').text
    desc  = product.at_css('div.card-body p').text
    price = product.at_css('div.card-footer').text.delete("^0-9")
    { name: name, desc: desc, price: price }
  end
  
  puts @products
  
end

# module PaypayScrapesConcern
#   require 'open-uri'
#   require 'nokogiri'

#   def set_paypay_shops
#     url = 'https://paypay.ne.jp/notice/20200604/01/'

#     charset = nil
#     html = URI.open(url) do |f|
#       charset = f.charset
#       f.read
#     end

#     doc = Nokogiri::HTML.parse(html, nil, charset)

#     @shops = []

#     doc.xpath('tr/td').each do |node|
#       @shops << node.text
#     end

#     @shops = @shops.drop(1)
#     p @shops
#   end
# end
