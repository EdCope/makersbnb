require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/rentals'

class MakersBnB < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader 
  end

  get '/' do
    @rentals = Rentals.all
    erb :index
  end

  get '/add_rental' do
    erb :add_rental
  end

  post '/add_rental' do
    redirect '/'
  end

  run! if app_file == $0

end
