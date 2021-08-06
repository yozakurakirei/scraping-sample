require 'mechanize'

agent = Mechanize.new
sleep 1
# ログインページにアクセス
page = agent.get("https://scr-labo.com/sample/chap3-main.php")
# フォームを取得 login
form = page.forms.first
form.field_with(name: "mail").value = "kanezoh@example.com"
form.field_with(name: "pass").value = "kanezoh"
# フォームを送信
sleep 1
next_page = form.submit
# リンクをクリック
sleep 1
target_page = next_page.links.first.click
# キーワードを取得
puts target_page.search("p#keyword").text


