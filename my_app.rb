#
# myapp.rb
require 'bundler'
Bundler.require
require 'sinatra/base'
require 'sinatra/json'
#require 'nokogiri'
#require 'open-uri'

class MyApp < Sinatra::Base

  set :root, "/"

  register(Sinatra::Cache)


  set :cache_enabled, true

  get '/' do
    page = Nokogiri::HTML(URI.open('https://www.google.com/finance/quote/YELP:NYSE'))
    price = page.css('.YMlKec.fxKbKc')[0].text.to_s.encode("iso-8859-1").force_encoding("utf-8")
    json price: price
  end


    run! if app_file == $0
end
