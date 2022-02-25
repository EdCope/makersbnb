require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/rental'
require_relative './lib/user'
require_relative './lib/booking'
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
      rental_end_date: params[:rental_end_date],
      owner_id: session['username'].id
      )
    redirect '/'
  end

  post '/rental/:id' do
    @selected_rental = Rental.rental_by_id(id: params[:id])
    erb :request_form
  end

  post '/request' do
    Booking.add(owner_id: params['owner_id'],
    guest_id: session['username'].id,
    rental_id: params['rental_id'],
    requested_date: params['requested_date'])
    redirect '/myaccount'
  end

  post '/sign_in' do
    user_found = User.sign_in(username: params['username'], password: params['password'])
    if user_found.is_a?(User)
      session['username'] = user_found
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

  get '/myaccount' do
    @requests = Booking.user_dates(guest_id: session['username'].id)
    erb :myaccount
  end

  run! if app_file == $0

end
