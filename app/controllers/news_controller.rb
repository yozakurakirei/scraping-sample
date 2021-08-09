class NewsController < ApplicationController
  require 'open-uri'

  def index
    uri = "https://newsapi.org/v2/everything?q=%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%8B%E3%82%A2%0D%0A&sortBy=popularity&pageSize=100&apiKey=e0ce889ca64b4880be329380db0dadcf"
    article = URI.open(uri).read
    @articles = JSON.parse(article)
    # p @articles
  end
  
  def yahoo
    uri = "https://shopping.yahooapis.jp/ShoppingWebService/V3/itemSearch?appid=dj00aiZpPWdzSHp0TXhRWlpaRiZzPWNvbnN1bWVyc2VjcmV0Jng9ZjE-&genre_category_id=635&sort=-sold"
    hit = URI.open(uri).read
    @hits = JSON.parse(hit)
  end
end

