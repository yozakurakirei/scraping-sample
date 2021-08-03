class Work < ApplicationRecord
  require 'mechanize'

  def self.scrape
    agent = Mechanize.new
    page = agent.get("https://www.green-japan.com/")
    elements = page.search('card-info__wrapper')

  end
end
