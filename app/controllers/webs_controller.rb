class WebsController < ApplicationController
  require 'open-uri'
  require 'nokogiri'
  require 'selenium-webdriver'
  require 'webdrivers'

  def index
    agent = Mechanize.new
    page = agent.get("https://www.yahoo.co.jp/")
    @elements = page.search('h1')
  end

  def green
    agent = Mechanize.new
    page = agent.get("https://www.green-japan.com/")
    @title = page.search('#header_title')
    @option = page.search('option')
  end

  def indeed
    agent = Mechanize.new
    page = agent.get("https://jp.stanby.com/search?q=IT%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%8B%E3%82%A2%20%E6%AD%A3%E7%A4%BE%E5%93%A1&sr_fr=job_serp&utm_source=yjjob&utm_medium=featured&utm_campaign=yj_full")
    @elements = page.search('.job')
    @elements[0].text
  end

  def test
    Selenium::WebDriver::Chrome.path = ENV.fetch('GOOGLE_CHROME_BIN', nil)
    
    options = Selenium::WebDriver::Chrome::Options.new(
      prefs: { 'profile.default_content_setting_values.notifications': 2 },
      binary: ENV.fetch('GOOGLE_CHROME_SHIM', nil)
    )  


    @driver = Selenium::WebDriver.for :chrome, options: options
    
    sleep 2
    
    @driver.navigate.to 'https://www.green-japan.com/'
    # 特定のリソースを取得
    
    sleep 2
    @title = @driver.find_element(:css, '.card-info__heading-area__title').text
    
    @tag = @driver.find_element(:css, '.code-tag').text
    
    @area =  @driver.find_element(:css, '.card-info__detail-area__text').text
  end

  def paypay
#     sleep 1
#     url = 'https://paypay.ne.jp/notice/20200604/01/'

#     sleep 1 
#     html = URI.open(url).read
#     doc = Nokogiri::HTML.parse(html)
#     @shops = doc.css('tr/td')
#   end
#   puts @shops
  url = "https://scr-labo.com/sample/chap2.php"
  sleep 1
  html = URI.open(url).read
  doc = Nokogiri::HTML.parse(html)
  product_elems = doc.css('div.card')
  @products = product_elems.map do |product|
    name  = product.at_css('div.card-header').text
    desc  = product.at_css('div.card-body p').text
    price = product.at_css('div.card-footer').text.delete("^0-9")
    # { name: name, desc: desc, price: price }
  end
  
  puts @products
  end
end
