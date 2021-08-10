class YahooApisController < ApplicationController
  require 'open-uri'

  def index
    uri="https://job.yahooapis.jp/v1/furusato/company/?results=100&appid=dj00aiZpPWdzSHp0TXhRWlpaRiZzPWNvbnN1bWVyc2VjcmV0Jng9ZjE-"
    result = URI.open(uri).read
    @results = JSON.parse(result)
  end

  def work
    uri = 'https://job.yahooapis.jp/v1/furusato/jobinfo/?results=100&appid=dj00aiZpPWdzSHp0TXhRWlpaRiZzPWNvbnN1bWVyc2VjcmV0Jng9ZjE-'
    result = URI.open(uri).read
    @results = JSON.parse(result)
  end

  def wantedly

  end
end
