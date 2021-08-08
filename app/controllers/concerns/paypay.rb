module Paypay
  require 'open-uri'

  def paypay_scraping

    ActiveRecord::Base.establish_connection(
      :adapter=>"postgresql",
      :pool=>5,
      :timeout=>5000,
      :encoding=>"utf8",
      :username=>"MyApp",
      :password=>nil,
      :host=>"localhost",
      :database=>"MyApp_development"
    )

    sleep 1
    url = 'https://paypay.ne.jp/notice/20200604/01/'

    charset = nil
    html = URI.open(url) do |f|
      charset = f.charset
      f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)

    @paypays = []

    doc.xpath('//tr/td').each do |node|
      @paypays << node.text 
    end

    @paypays = @paypays.drop(1)
    pust @paypays
  end
end

puts "hello scraping"