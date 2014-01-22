Xvfb+seleniumを使ったCI環境を作る
======================

- seleniumを使った画面テスト
- rakeタスク(jenkins管理)でコマンド一発でテスト実行
- rspecでテスト実装

インストール
------------

- このプロジェクトをgit clone
- bundle install --path vendor/bundle --jobs=4

必須モジュール・パッケージ
------------

- ruby
- bundler
- selenium-server-standalone
- Xvfbと、その日本語環境
- firefox本体

実行
-----

- bundle exec rake Server:start selenium_server=standalone.jar
- bundle exec rake Test:XXXX
- bundle exec rake Server:stop

TODO
----

- jenkinsのrakeプラグインからの実行
- windows上のwebdriverで動かせるようにする
