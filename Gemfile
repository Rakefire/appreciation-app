source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "autoprefixer-rails"
gem "rack-canonical-host"
gem "passwordless"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.3"
gem "rails", "~> 5.2.3"
gem "sass-rails", "~> 5.0"
gem "tailwindcss", "~> 1.0.0"
gem "uglifier", ">= 1.3.0"
gem "turbolinks", "~> 5"
gem "rectify"
gem "simple_form"
gem "jbuilder", "~> 2.5"
gem "sidekiq"

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

group :development, :test do
  gem "rspec-rails", "~> 3.7"
  gem "bullet"
  gem "bundler-audit"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "pry-rails"
end

group :test do
  gem 'chromedriver-helper'
  gem "capybara"
  gem "faker"
  gem "formulaic"
  gem "rspec_junit_formatter"
  gem "selenium-webdriver"
  gem "timecop"
  gem "webmock"
  gem "wisper-rspec", require: false
end

group :development do
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "letter_opener"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  gem "rack-timeout"
end
