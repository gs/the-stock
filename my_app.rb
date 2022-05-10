#
# myapp.rb
require 'bundler'
Bundler.require
require 'sinatra/json'

get '/' do
  query = BasicYahooFinance::Query.new
  data = query.quotes('YELP')
  price = data['YELP']['regularMarketPrice']
  json price: price
end
