source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem "jquery-rails"
gem "bcrypt", "3.1.11"
gem "bootstrap-sass", "~> 3.3"
gem "rails", "~> 5.1.1"
gem "sqlite3"
gem "config"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "faker", "1.7.3"
gem "will_paginate", "3.1.5"
gem "bootstrap-will_paginate", "1.0.0"
gem "dotenv-rails", "1.0.0"
gem "carrierwave", "1.2.2"
gem "mini_magick", "4.7.0"
gem "fog", "1.42"

group :development, :test do
  gem "database_cleaner"
  gem "brakeman", require: false
  gem "jshint"
  gem "bundler-audit"
  gem "rubocop", "~> 0.35.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "eslint-rails", git: "https://github.com/octoberstorm/eslint-rails", require: false
  gem "scss_lint_reporter_checkstyle", require: false
  gem "scss_lint", "~> 0.54.0", require: false
  gem "rails_best_practices"
  gem "reek"
  gem "railroady"
  gem "autoprefixer-rails"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "byebug"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# group :test do
#   gem "simplecov", require: false
#   gem "simplecov-rcov", require: false
#   gem "simplecov-json"
#   gem "shoulda-matchers"
# end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
