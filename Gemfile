source 'https://rubygems.org'

gem 'rails', '3.2.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'aasm'

group :development, :test do
  gem 'rspec-rails'                     # Use rspec to do our integration tests.
  gem 'factory_girl_rails'              # Factory girls makes it easy to mock objects for our tests.
  gem 'capybara'                        # Capybara lets us drive our integration tests via headless browser.
  gem 'launchy'                         # Launchy let's us launch the current state of the app in the browser if we need to diagnose.
  gem 'database_cleaner'                # Necessary for undoing transactions in the database during our integration tests.
  gem 'sqlite3'                         
  gem 'evergreen', :require => 'evergreen/rails'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem "spork", "> 0.9.0.rc"
  gem "guard-spork"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
