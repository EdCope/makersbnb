require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/rental'
require_relative './lib/user'
require 'pg'

class MakersBnB < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader 
  end

  enable :sessions

  get '/' do
    @rentals = Rental.all
    @username = session['username']
    
    erb :index
  end

  get '/add_rental' do
    erb :add_rental
  end

  post '/add_rental' do
    Rental.add(
      title: params[:title], 
      rental_description: params[:rental_description], 
      price: params[:price], 
      contact_details: params[:contact_details],
      rental_start_date: params[:rental_start_date],
      rental_end_date: params[:rental_end_date]
      )
    redirect '/'
  end

  post '/sign_in' do
    user_found = User.sign_in(username: params['username'], password: params['password'])
    if user_found.is_a?(User)
      session['username'] = user_found.username
    
    end
    redirect '/'    
  end

  get '/sign_out' do
    session.clear
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
