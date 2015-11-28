source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

#https://github.com/jashkenas/coffeescript/issues/3829
gem 'coffee-script-source', '1.8.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# it requires
gem 'therubyracer', '0.12.1'
gem 'libv8', '3.16.14.7'
gem 'compass', '~> 1.0.3'
gem 'compass-rails', '~> 2.0.1'

# Constant
gem 'settingslogic'

# js template
gem 'eco'

# rails -> jsにデータを渡す
gem 'gon'

# for session, cache
gem 'redis-rails'
gem 'hiredis'
# redis AR objects
gem 'redis-objects'
# add namespace for redis
gem 'redis-namespace'

# error時にメールを送ってくれる
gem 'exception_notification', '4.1.0.rc1'

# パスワードのハッシュ化
gem 'bcrypt-ruby'

# delayed_job
gem 'delayed_job_active_record'
gem 'delayed_job', git: "https://github.com/collectiveidea/delayed_job", branch: "master"
gem 'daemons'

# hipchat api
# gem 'hipchat'

# for cron
gem 'whenever'

# gem 'devise'
gem 'seed-fu', '~> 2.3'

# WebApi library
gem 'faraday'
gem 'faraday_middleware'
gem 'activerecord-import', git: 'https://github.com/urokuta/activerecord-import', branch: "issues/139-enums-are-not-working"
gem 'serialize-rails', git: 'https://github.com/mrbrdo/serialize-rails'

# Twitter
gem 'twitter'

gem "libxml-ruby"
gem 'nokogiri'

# 画像のサイズ取得
gem 'fastimage', git: "https://github.com/urokuta/fastimage", branch: "master"
gem 'image_size'

gem 'devise'

# slack
gem 'slack-notifier'

# admin
# ActiveAdmin
gem 'activeadmin', github: 'activeadmin'

# amazon product advertising api
gem 'amazon-ecs'

# ローマ字をひらがなに変換
gem 'romkan'

# sitemap
gem 'sitemap_generator'

gem 'delayed_job_web'


group :development do
  gem 'capistrano', '3.2.1'
  gem 'capistrano-rbenv'
  gem 'capistrano-rails'
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-byebug' # needs ruby-2.0.0-p247
  gem 'pry-stack_explorer'
  gem 'terminal-notifier-guard'

  gem 'quiet_assets'
  #gem 'rack-mini-profiler'
end

group :test do
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
  gem 'spring-commands-rspec'
#   gem 'pry'
#   gem 'pry-doc'
#   gem 'pry-rails'
#   gem 'pry-byebug' # needs ruby-2.0.0-p247
#   gem 'pry-stack_explorer'

end

gem 'iso8601'
