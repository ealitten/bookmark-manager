# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby '2.4.1'

gem 'data_mapper'
gem 'dm-postgres-adapter'
gem 'rake'
gem 'sinatra'

group :test do
  gem 'database_cleaner'
  gem 'rspec'
  gem 'capybara'
end
