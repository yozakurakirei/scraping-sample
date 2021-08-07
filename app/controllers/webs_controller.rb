class WebsController < ApplicationController

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
    page = agent.get("https://jp.indeed.com/%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%8B%E3%82%A2%E9%96%A2%E9%80%A3%E3%81%AE%E6%B1%82%E4%BA%BA%E6%9D%B1%E4%BA%AC")
    @elements = page.search('h1')
    @elements.inner_text
  end

  def test
    agent = Mechanize.new
    page = agent.get('http://www.sweetsbox.jp/')
    @test = page.search('li a')
  end
end
