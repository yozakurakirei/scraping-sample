require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
sleep 1
driver.navigate.to 'https://www.personal.co.jp/'

puts driver.find_element(:css, '#item_list').text
sleep 1
