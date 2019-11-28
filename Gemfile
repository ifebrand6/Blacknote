# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'

gem 'active_type', '>= 0.3.2'
gem 'autoprefixer-rails', '>= 5.0.0.1'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'bootstrap-sass', '~> 3.3'
gem 'bootstrap_form', '~> 2.3'
gem 'coffee-rails', '~> 4.2'
gem 'dotenv-rails', '>= 2.0.0'
gem 'font-awesome-rails'
gem 'pg', '>= 0.18'
gem 'pgcli-rails'
gem 'puma', '~> 4.1'
gem 'rack-canonical-host', '~> 0.2.3'
gem 'rails', '~> 5.2.3'
gem 'redis', '~> 4.0'
gem 'sass-rails', '~> 6.0'
gem 'sidekiq', '>= 4.2.0'
gem 'turbolinks', '~> 5'
gem 'devise'
# gem "webpacker"

group :production do
  gem 'postmark-rails'
end

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'annotate', '>= 2.5.0'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman', require: false
  gem 'bundler-audit', '>= 0.5.0', require: false
  gem 'guard', '>= 2.2.2', require: false
  gem 'guard-livereload', require: false
  gem 'guard-minitest', require: false
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5'
  gem 'overcommit', '>= 0.37.0', require: false
  gem 'rack-livereload'
  gem 'rubocop', '>= 0.70.0', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'simplecov', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'terminal-notifier', require: false
  gem 'terminal-notifier-guard', require: false
  gem 'thin', require: false
  gem 'xray-rails', '>= 0.1.18'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'launchy'
  gem 'minitest-ci', '>= 3.3.0', require: false
  gem 'mock_redis'
  gem 'selenium-webdriver'
  gem 'shoulda-context'
  gem 'shoulda-matchers', '>= 3.0.1'
  gem 'webdrivers'
end
