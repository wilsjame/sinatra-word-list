# load bundle before loading the Sinatra app
require 'rubygems'
require 'bundler'

Bundler.require

require './app'
run Sinatra::Application

# start development server with rackup, and Sinatra will be loaded via Bundler
# $ bundle exec rackup
