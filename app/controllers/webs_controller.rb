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
end
