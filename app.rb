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
  # @@drawned = []
  session["drawned"] = []
  haml :index
end

post '/raffle' do
    if session["names"].nil? or session["names"].empty?
      session["names"] = Extractor.get_names(params['contestants'][:tempfile])
    else
      session["drawn"] = Raffle.do_raffle!(session["names"])
      session["drawned"].push(session["drawn"])
    end
    haml :raffle
end
