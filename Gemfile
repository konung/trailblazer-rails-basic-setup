source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1'
# Use mysql as the database for Active Record
gem 'mysql2', '0.5.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'responders', '~> 2.4.0'

# Trailblazer
gem 'trailblazer', '~> 2.0.6'
gem 'trailblazer-rails', '~> 1.0.2'
gem 'trailblazer-endpoint', github: 'trailblazer/trailblazer-endpoint'

# If you want to replace ActionView with the awesomeness of Cells
# There are adapters for Slim & Haml as well. Hamlit is faster than both.
gem 'cells-rails' , '~> 0.0.8'
gem 'hamlit-rails', '~> 0.2.0'
gem 'cells-hamlit', '~> 0.2.0'
gem 'trailblazer-cells', '~> 0.0.3'

# For validation. You could stick with ActiveModel validations, but dry.rb stuff is nicer IMHO
gem 'reform', '~> 2.2.4'
gem 'reform-rails', '~> 0.1.7'
gem 'dry-validation', '~> 0.10.7'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'awesome_print'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'minitest-rails'
  gem 'minitest-spec-rails'
  gem 'minitest-reporters'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
