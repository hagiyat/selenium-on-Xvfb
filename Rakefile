namespace :Server do
    desc 'seleniumサーバーの立ち上げ'
    task :start do
        sh "Xvfb :99 -screen 0 1024x768x24 &"
        sh "export DISPLAY=:99;java -jar #{ENV['selenium_server']} &"
    end

    desc 'seleniumサーバーを落とす'
    task :stop do
        sh "pkill -f selenium-server-standalone"
        sh "pkill -f Xvfb"
    end
end

namespace :Test do
    desc 'テスト実行'
    task :test do
        sh "bundle exec rspec spec/login.rb"
    end
end
