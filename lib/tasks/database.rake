namespace :database do
  desc 'データベース接続'
  task :get_user => :environment do 
    all_users = User.all

    all_users.each_with_index do |user, idx|
      puts "No#{idx}"
      puts "名前: #{user.name}"
      puts "年齢: #{user.age}"
    end
  end
end
