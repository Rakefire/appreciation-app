source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "autoprefixer-rails"
gem "rack-canonical-host"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "tachyons-rails"


# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

group :development, :test do
  gem "rspec-rails", "~> 3.7"
  gem "bullet"
  gem "bundler-audit"
  gem "dotenv-rails"
  gem "factory_bot_rails"
end

group :test do
  gem "capybara-webkit"
  gem "timecop"
end

group :development do
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "pry-rails"
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  gem "rack-timeout"
end
