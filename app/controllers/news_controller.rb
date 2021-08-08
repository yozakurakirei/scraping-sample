class NewsController < ApplicationController
  require 'open-uri'

  def index
    # api = Rails.application.credentials.news_api[:e0ce889ca64b4880be329380db0dadcf]
    uri = "https://newsapi.org/v2/everything?q=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9&sortBy=popularity&apiKey=e0ce889ca64b4880be329380db0dadcf"
    article = URI.open(uri).read
    @articles = JSON.parse(article)
    puts @articles
  end
end

