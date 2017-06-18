require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'byebug' if development?
require 'haml'
require_relative './lib/extractor'
require_relative './lib/raffle'

enable :sessions
get '/' do
  session.clear
  session["drawned"] = []
  haml :index
end

post '/raffle' do
    if session["names"].nil?
      session["names"] = Extractor.get_names(params['contestants'][:tempfile])
    else
      session["drawn"] = Raffle.do_raffle!(session["names"])
      if session["drawn"] != "Empty list"
        session["drawned"].push(session["drawn"])
      end
    end
    haml :raffle
end
