require 'open-uri'
require 'nokogiri'

# def fetch_products(url)
#   sleep 1
#   html = URI.open(url).read # URI.openでurlに指定したものを取ってくる
#   doc = Nokogiri::HTML.parse(html) # HTMLにパースする
#   product_elems = doc.css('div.card') # データが入ってる大元のCSS
#   return nil if product_elems.empty?
#   products = product_elems.map do |product| # 大元を回して各要素を取得
#     name  = product.at_css('div.card-header').text
#     desc  = product.at_css('div.card-body p').text
#     price = product.at_css('div.card-footer').text.delete("^0-9")
#     { name: name, desc: desc, price: price }
#   end
#   puts products
# end

# url = "https://scr-labo.com/sample/chap2.php"
# all_products = []
# loop do 
#   p url
#   products = fetch_products(url)
#   break if products.nil?
#   all_products << products
#   url += "?p" if url.query.nil?
#   query_params = URI.decode_www_form(url.query).to_h
#   query_params["p"] = query_params["p"].to_i + 1
#   url.query = URI.encode_www_form(query_params)
# end

# puts all_products.flatten

# base url
def fetch_html(url)
  sleep 1
  html = URI.open(url).read
end

# product number
def fetch_products_num(url)
  url = fetch_html(url)
  doc = Nokogiri::HTML.parse(url)
  doc.at_css('p.products-num').text.delete("^0-9").to_i
end

def fetch_products(url)
  html = fetch_html(url)
  doc = Nokogiri::HTML.parse(html)
  product_elems = doc.css('div.card')
  products = product_elems.map do |f|
    name = f.product.at_css('div.card-header').text
    desc = f.product.at_css('div.card-body p').text
    price = f.product.at_css('div.card-footer').text.delete("^0-9")
    { name: name, desc: desc, price: price }
  end
end

url = URI("https://scr-labo.com/sample/chap2.php")
products_num = fetch_products_num(url)
loop_num = products_num / 30 + 1
all_products = []
loop_num.times do 
  p url
  products = fetch_products(url)
  all_products << products
  url += "?p" if url.query.nil?
  query_params = URI.decode_www_form(url.query).to_h
  query_params["p"] = query_params["p"].to_i + 1
  url.query = URI.encode_www_form(query_params)
end

p all_products.flatten.size


# foo = fetch_html("https://www.green-japan.com/")
# puts foo

# bar = fetch_products_num("https://scr-labo.com/sample/chap2.php?p=14")
# puts bar

# bar = fetch_products("https://scr-labo.com/sample/chap2.php?p=14")
# puts bar
