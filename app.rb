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
  # store the word list as an instance variable to be shown by the view
  File.open("words.txt", "a+") do |f|
    @words = f.readlines
  end
  # render the views/words.erb template
  erb :words
end

post '/words' do
  # append the user's submitted form data to the word list
  File.open("words.txt", "a+") do |f|
    f.puts "#{params[:word]} - #{params[:meaning]}"
  end
  # store the word list as an instance variable to be shown by the view
  File.open("words.txt", "a+") do |f|
    @words = f.readlines
  end
  # render the views/words.erb template
  erb :words
end
