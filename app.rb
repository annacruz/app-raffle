require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'byebug' if development?
require 'haml'
require_relative './lib/extractor'
require_relative './lib/raffle'

enable :sessions

get '/' do
  haml :index
end

post '/raffle' do
    tempfile = params['contestants'][:tempfile]
    filename = params['contestants'][:filename]
    extractor = Extractor.new()
    session["names"] = extractor.get_names(tempfile)
    haml :raffle
end

post '/raffled' do
  raffle = Raffle.new()
  names = session["names"]
  @drawn = raffle.do_raffle!(names)
  haml :raffled
end
