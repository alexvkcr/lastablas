source 'https://rubygems.org'

gem 'rails', '~>4.1'

### OpenShift Online changes:

# Fix the conflict with the system 'rake':
# gem 'rake', '~> 0.9.6'

# Executed bundle update rake in OpenShift to update it to 11.1.2
gem 'rake'

# Support for databases and environment.
# Use 'sqlite3' for testing and development and mysql and postgresql
# for production.
#
# To speed up the 'git push' process you can exclude gems from bundle install:
# For example, if you use rails + mysql, you can:
#
# $ rhc env set BUNDLE_WITHOUT="development test postgresql"
#

# gems for development
group :devel do
  gem 'web-console', "~>2.0"
  gem 'guard-rspec', :require => false
  gem 'listen', "~> 3.0.0" # Because of ruby 2.0
  gem 'rubocop'
end
group :development, :test do
  gem 'sqlite3'
  gem 'minitest'
  gem 'thor'
  gem "rspec-rails",    "~>3.4"
  gem 'byebug'
  gem 'capybara',       "~>2.7.0"
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'faker'
end

group :test do
  gem 'minitest-reporters'
  gem 'mini_backtrace'
  gem 'guard-minitest'
  gem "launchy"
  gem "selenium-webdriver"
end

## Add support for the MySQL
#group :production, :mysql do
#  gem 'mysql2'
#end

group :production, :postgresql do
gem 'pg'
gem 'rails_12factor'
end

### / OpenShift changes

# Use SCSS for stylesheets and patternfly
# Install it wil bower, not as a gem, to install JS dependencies
gem 'patternfly-sass', '~> 3.7.0'
gem 'sass-rails', '>= 3.5'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.

group :doc do
gem 'sdoc', '~> 0.4.0'
end
# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
group :devel do
gem 'spring'
end

# Add rack specific version to fix deployment error
# in OpenShift online

gem 'rack', '1.5.2'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
#
#
# Create multi-language
# gem "rails-i18n",                                                     :git => "git://github.com/svenfuchs/rails-i18n.git", :branch => "master"

# Paginate helper gem
gem 'bootstrap-will_paginate'
# Devise
gem 'devise', "~> 3.0" # 4.0 needs ruby 2.2

# Let's get a copy of documentation
# Generating guides requires Redcarpet 2.1.1+.
gem 'redcarpet', '~> 2.1.1'

# Introducing Angular UI
gem "angular-ui-bootstrap-rails",     "~>1.3.0"

#Using mailchimp official gem
gem "mailchimp-api",  "~2.0.6"