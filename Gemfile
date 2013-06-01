source 'https://rubygems.org'

ruby "2.0.0"
gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mongoid', '~> 3.1.3'
gem 'mongoid_rails_migrations', '~> 1.0.0'

#no more webrick
gem 'thin'

gem 'devise' , '~> 2.2.4'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'haml-rails'
gem 'jquery-rails'
gem "bootstrap-sass", "~> 2.3.1.0"
gem "simple_form", "~> 2.1.0"

group :development do
  gem 'pry-rails', '~> 0.3.0'
end

gem 'rspec-rails', '~> 2.13.0', group: [:development, :test]
group  :test do
  gem 'rspec-given'
  gem 'spork-rails', '~> 3.2.1'
  gem "factory_girl_rails", "~> 4.2.1"
  gem 'database_cleaner'
  gem 'pry'
  gem 'pry-byebug'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
