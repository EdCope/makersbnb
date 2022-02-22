require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/rentals'
require 'pg'

class MakersBnB < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader 
  end

  get '/' do
    @rentals = Rentals.all
    erb :index

  end

  run! if app_file == $0

end
