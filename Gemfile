source 'https://rubygems.org'

# core
gem 'rails', '3.2.12'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'resourcery', github: 'hmans/resourcery', branch: 'master'

# frontend
gem 'slim-rails'
gem 'quiet_assets'
gem 'simple_form'
gem 'jquery-rails'

# image handling
gem 'dragonfly', '~>0.9.12'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'compass-rails'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'debugger'
end

group :development do
  gem 'capistrano'
end

group :production do
  # gem 'mysql2'
  gem 'pg'
  gem 'therubyracer'

  # when using S3
  gem 'fog'
end

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'
