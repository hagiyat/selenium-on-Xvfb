#
# ログイン画面テスト
#

require 'rubygems'
require 'bundler'
Bundler.require

describe "ログイン画面" do
    let(:browser) do
        Watir::Browser.new(
            :remote, :url => "http://localhost:4444/wd/hub")
    end

    context "ログイン画面開く？" do
        subject do
            browser.goto "https://domain.com/login"
            browser.driver.save_screenshot "/tmp/login.png"
        end
        it do
            should be_true
        end
    end

    context "ログインする" do
        before do
            browser.goto "https://domain.com/login"
            browser.wait

            browser.text_field(:id => "email").set("email@domain.com")
            browser.text_field(:id => "password").set("password")
            browser.button(:id, "do-login").click

            browser.driver.save_screenshot "/tmp/login_after.png"
        end

        subject do
            browser.url
        end

        it do
            should == "https://domain.com/dashboard"
        end
    end

    context "ログイン後の名前表示チェック" do
        before do
            browser.goto "https://domain.com/dashboard"
            browser.driver.save_screenshot "/tmp/login_after_bar.png"
        end

        subject do
            browser.div(:id => "target-element").a.text
        end

        it do
            should == "hagiyat"
        end
    end

end

