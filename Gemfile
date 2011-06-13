source 'http://rubygems.org'

gem 'rails', '3.0.8'
gem 'paperclip'
gem 'aasm'
gem 'streamio-ffmpeg'
gem 'daemons'
gem 'russian', :git => "git://github.com/yaroslav/russian.git"
gem 'devise'



group :development do 
  gem 'nifty-generators'
  gem 'annotate'
end

group :development, :test do
  gem 'guard'
  if RUBY_PLATFORM =~ /linux/i
    gem 'rb-inotify' 
    gem 'libnotify' 
  end
  gem 'rspec-rails'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'guard-spork'
end
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
gem "mocha", :group => :test
