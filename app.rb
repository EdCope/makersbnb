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

  get '/add_rental' do
    erb :add_rental
  end

  post '/add_rental' do
    Rentals.add(
      title: params[:title], 
      rental_description: params[:rental_description], 
      price: params[:price], 
      contact_details: params[:contact_details]
      )
    redirect '/'
  end

  get '/add_user' do
    erb :add_user
  end
  
  post '/add_user/new' do
    User.add(
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    redirect '/'
  end

  run! if app_file == $0

end
