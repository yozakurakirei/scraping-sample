require 'benchmark'
require 'mechanize'
require 'selenium-webdriver'


def selenium
  driver = Selenium::WebDriver.for :chrome
  sleep 1

  # ログインページにアクセス
  driver.navigate.to 'https://scr-labo.com/sample/chap3-login-form.php'
  # フォームに入力
  driver.find_element(:name, 'mail').send_keys('kanezoh@example.com')
  driver.find_element(:name, 'pass').send_keys('kanezoh')

  sleep 1
  driver.find_elements(:css, 'input').last.click
  # リンクをクリック
  sleep 1 
  driver.find_element(:css, 'a').click
  p driver.find_element(:id, 'keyword').text
end

def mechanize
  agent = Mechanize.new
  sleep 1
  # ログインページにアクセス
  page = agent.get('https://scr-labo.com/sample/chap3-login-form.php')
  # フォームに入力
  form = page.forms.first
  form.field_with(name: "mail").value = 'kanezoh@example.com'
  form.field_with(name: "pass").value = 'kanezoh'
  # フォームを保存
  sleep 1
  next_page = form.submit
  # リンクをクリック
  target_page = next_page.links.first.click
  # キーワードを取得
  p target_page.search('p#keyword').text
end

def daynamic
  driver = Selenium::WebDriver.for :chrome
  sleep 1
  
  driver.navigate.to 'https://scr-labo.com/sample/chap4.html'
  # 現在のページリソースを取得(全部)
  p driver.page_source
  
  # 特定のリソース取得
  p driver.find_element(:css, 'h2').text
end

def green 
  driver = Selenium::WebDriver.for :chrome
  sleep 1
  
  driver.navigate.to 'https://www.green-japan.com/'
  # 特定のリソースを取得
  
  p driver.find_element(:css, '.card-info__heading-area__title').text
  
  puts driver.find_element(:css, '.code-tag').text
  
  puts driver.find_element(:css, '.card-info__detail-area__text').text
end

def personal
  driver = Selenium::WebDriver.for :chrome
  sleep 1
  driver.navigate.to 'https://www.personal.co.jp/'

  puts driver.find_element(:css, '#item_list').text
  sleep 1
end

Benchmark.bm 10 do |r|
  r.report "Selenium" do 
    selenium
  end

  r.report "Mechanize" do 
    mechanize
  end

  r.report "Daynamic" do
    daynamic
  end

  r.report "Green" do
    green
  end

  r.report "Personal" do 
    personal
  end
end