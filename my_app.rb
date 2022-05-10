#
# myapp.rb
require 'bundler'
Bundler.require
require 'sinatra/base'
require 'sinatra/json'

class MyApp < Sinatra::Base

  set :root, "/"

  register(Sinatra::Cache)


  set :cache_enabled, true

  get '/' do
    query = BasicYahooFinance::Query.new
    data = query.quotes('YELP')
    price = data['YELP']['regularMarketPrice']
    json price: price
  end


    run! if app_file == $0
end
