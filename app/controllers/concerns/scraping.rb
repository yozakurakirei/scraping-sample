module Scraping
  require 'mechanize'

  sleep 1
  agent = Mechanize.new
  page = agent.get("https://paypay.ne.jp/notice/20200604/01/")

  sleep 1
  @shop = page.search('tr/td')

  puts @elements
end