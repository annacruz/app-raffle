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
    # byebug
    if session["names"].nil? or session["names"].empty?
      session["names"] = Extractor.get_names(params['contestants'][:tempfile])
    else
      @drawn = Raffle.do_raffle!(session["names"])
      puts @drawn
    end
    haml :raffle
end
