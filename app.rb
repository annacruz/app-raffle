require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
  haml :index
end

post '/raffle' do
    tempfile = params['contestants'][:tempfile]
    filename = params['contestants'][:filename]
    
end
