# app.rb is a simple
# word list Sinatra app

# use bundler
require 'rubygems'
require 'bundler/setup'
# load all of the gems in the gemfile
Bundler.require(:default)

require "sinatra/reloader" if development?
# make WordItem class available to query word_items table in the database
require './models/WordItem'

set :database, {adapter: "sqlite3", database: "db/development.sqlite3"}

# define a route for the root of the site
get '/' do
  # render the views/index.erb template
  erb :index
end

get '/words' do
  # return a collection with all words
  @words = WordItem.all
  # render the views/words.erb template
  erb :words
end

post '/words' do
  # add a new item to the database
  WordItem.create(name: params[:word], meaning: params[:meaning])
  # return a collection with all words
  @words = WordItem.all
  # render the views/words.erb template
  erb :words
end

# for testing
get '/words-all-gone' do
  WordItem.destroy_all
  @words = WordItem.all
  erb :words
end
