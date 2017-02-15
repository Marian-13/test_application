source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  # rspec-rails is a testing framework for Rails 3.x, 4.x and 5.0
  gem 'rspec-rails', '~> 3.5'

  # Capybara helps you test web applications by simulating how a real user would interact with your app
  gem 'capybara', '~> 2.12.0'

  # factory_girl_rails provides Rails integration for factory_girl
  gem 'factory_girl_rails', '~> 4.8.0'

  # Library for stubbing and setting expectations on HTTP requests in Ruby
  gem 'webmock', '~> 2.3.2'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# bootstrap-sass is a Sass-powered version of Bootstrap 3
gem 'bootstrap-sass', '~> 3.3.6'

# font-awesome-rails provides the Font-Awesome web fonts
gem 'font-awesome-rails', '~> 4.7.0.1'

# A Ruby wrapper for the Instagram REST and Search APIs
gem 'instagram', '~> 1.1.6'

# A Sprockets transformer that converts ES6 code into vanilla ES5 with Babel JS.
gem 'sprockets-es6', '~> 0.9.2'

# APICache allows any API client library to be easily wrapped with a robust caching layer
gem 'api_cache', '~> 0.3.0'
