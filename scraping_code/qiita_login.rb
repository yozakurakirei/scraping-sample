require 'mechanize'

# これは失敗
agent = Mechanize.new

sleep 1
page = agent.get('https://qiita.com/login?redirect_to=%2F')

form = page.forms.first
form.field_with(type: "text").value = "matchnokaori@gmail.com"
form.field_with(type: 'password').value = 'wad38393839'

sleep 1
next_page = form.submit

sleep 1
login = next_page.links.first.click

puts login.search('.personalized-feed-side-ad')


