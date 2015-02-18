source 'https://rubygems.org'
ruby '2.1.3'
#ruby-gemset=rails4

gem 'rails', '4.1.4'
gem 'pg'
gem 'puma'
gem 'unicorn'

gem 'bootstrap-sass', '~> 3.2.0'
gem 'bootstrap-will_paginate'
gem 'sass-rails', '~>4.0.1'
gem 'autoprefixer-rails'

gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '3.0.4'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'
gem 'pry-rails'
gem 'pry-theme'
gem 'bcrypt'
gem 'faker'
gem 'will_paginate'
gem 'sprockets'
gem 'carrierwave-aws'
gem "mini_magick"
gem "fog"
# gem 'dragonfly'
# gem 'sunspot_rails'
# gem 'sunspot_solr'
# gem 'progress_bar'
gem 'bootsy'

### S3 ###
gem 'aws-sdk'

# HEROKU
gem 'newrelic_rpm' 

group :development, :test do
  gem 'rspec-rails'
  gem 'rspec-core', '2.13.1'
  gem 'minitest'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails'
  gem 'launchy'
end

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'rails_12factor', '0.0.2'
  gem 'rack-cache', :require => 'rack/cache'
end
