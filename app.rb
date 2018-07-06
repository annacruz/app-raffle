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
    if session["filename"].nil?
      file = params['contestants'][:tempfile]
      session["filename"] = file.path
    else
      path = session["filename"]
      file = File.open(path, "r")
      names = Extractor.get_names(file)
      session["drawn"] = Raffle.do_raffle!(names)
      if session["drawn"] != "Empty list"
        session["drawned"].push(session["drawn"])
      end
    end
    haml :raffle
end
