# require 'selenium-webdriver'
# require 'nokogiri'

# driver = Selenium::WebDriver.for :chrome

# sleep 1
# driver.navigate.to 'https://scr-labo.com/sample/chap6-main.html'

# # 前回スクロール時の商品数を格納する変数 初期値は0
# previous_menu_num = 0
# loop do
#   driver.execute_script("
#       let pageHeight = document.documentElement.scrollHeight;
#       window.scroll(0, pageHeight);
#     ")
#   # スクロール後現在の商品を格納する
#   current_menu_num = driver.execute_script("return document.getElementByClassName('col-3').lenght")
#   # 終了条件 => 商品数が増えてなかったら終了する
#   break unless current_menu_num > previous_menu_num
#   current_menu_num = previous_menu_num
#   # 無限スクロールの読み込みまち
#   sleep 2
# end

# # HTMLの表示
# html = driver.page_source
# doc = Nokogiri::HTML.parse(html)
# puts doc.css('div.col-3').size


# # 対象ページを開いてスクレイピング
# # 何度かスクロールして、商品情報が出てこなくなったら最後だと判断して
# # HTMLを表示する

# # 自分の考え
# # 要素を取得
# # 繰り替えし
# # 表示

require 'selenium-webdriver'
require 'nokogiri'

driver = Selenium::WebDriver.for :chrome
sleep 1
driver.navigate.to 'https://scr-labo.com/sample/chap6-main.html'
# 前回スクロール時の商品数を格納する変数、初期値は0
previous_menu_num = 0
loop do
  driver.execute_script("
    let pageHeight = document.documentElement.scrollHeight;
    window.scroll(0, pageHeight);
  ")
  # スクロール後の現在の商品数を格納する変数
  current_menu_num = driver.execute_script("return document.getElementsByClassName('col-3').length")
  # 終了条件、商品数が前回と比べて増えていなければ終了
  break unless current_menu_num > previous_menu_num
  previous_menu_num = current_menu_num
  # 無限スクロールの読み込み待ちのsleep
  sleep 1
end
# この状態でページソースを取得すれば全ての商品情報がのったHTMLを取得できる
html = driver.page_source
doc = Nokogiri::HTML.parse(html)
p doc.css('div.col-3').size