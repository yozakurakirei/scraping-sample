require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
sleep 1

driver.navigate.to 'https://scr-labo.com/sample/chap4.html'
# 現在のページリソースを取得(全部)
p driver.page_source

# 特定のリソース取得
puts driver.find_element(:css, 'h2').text



