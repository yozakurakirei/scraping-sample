require 'mechanize'

agent = Mechanize.new
sleep 1
page = agent.get("https://scr-labo.com/sample/chap3-login-form.php")
form = page.forms.first
form.field_with(name: 'mail').value = 'kanezoh@example.com'
form.field_with(name: 'pass').value = 'kanezoh'

# フォームの送信
sleep 1
next_page = form.submit
# リンクをクリック
sleep 1
target_page = next_page.links.first.click
# keyword 取得
p target_page.search('p#keyword').text
