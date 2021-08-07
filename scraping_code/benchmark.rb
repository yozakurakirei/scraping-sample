def daynamic
  driver = Selenium::WebDriver.for :chrome
  sleep 1

  driver.navigate.to 'https://scr-labo.com/sample/chap4.html'
  # 現在のページリソースを取得
end