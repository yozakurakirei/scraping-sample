class PaypaysController < ApplicationController

  def index
    sleep 1
    agent = Mechanize.new
    page = agent.get("https://paypay.ne.jp/notice/20200604/01/")
  
    sleep 1
    @elements = page.search('tr/td')
  
    puts @elements
  end
end
