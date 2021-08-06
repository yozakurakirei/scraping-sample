require 'mechanize'

agent = Mechanize.new
sleep 1
page = agent.get('https://saizy.herokuapp.com/login')

form = page.forms.first
form.field_with(type: "email").value = "admin@example.com"
form.field_with(type: "password").value = "password"

# form 送信
sleep 1
next_page = form.submit

sleep 1
target_page = next_page.links.first.click

puts target_page.search('.post-desc h3')
puts target_page.search('.day span')
