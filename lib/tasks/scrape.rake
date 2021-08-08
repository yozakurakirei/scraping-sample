require 'open-uri'

namespace :scrape do
  desc 'paypayのサイトからスクレイピング'
  task :paypay_title => :environment do 
    sleep 1
    url = 'https://paypay.ne.jp/notice/20200604/01/'

    charset = nil
    html = URI.open(url) do |f|
      charset = f.charset
      f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)

    doc.xpath('//tr/td').each do |node|
      puts node.inner_text
    end
  end
end

namespace :scrape do 
  desc 'hello world'
  task :hello_world => :environment do
    puts "hello world!"
  end
end
