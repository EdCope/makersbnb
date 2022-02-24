require_relative '../spec/database_selector'
require 'pg'

class Booking
  attr_reader :owner_id, :guest_id, :rental_id, :requested_date

  def initialize(id:, owner_id:, guest_id:, rental_id:, requested_date:)
    @id = id
    @owner_id = owner_id
    @guest_id = guest_id
    @rental_id = rental_id
    @requested_date = requested_date
    
  end

  def self.add(owner_id:, guest_id:, rental_id:, requested_date:)
    connection = db_selector
    result = connection.exec("INSERT INTO bookings (owner_id, guest_id, rental_id, requested_date) 
    VALUES('#{owner_id}', '#{guest_id}', '#{rental_id}', '#{requested_date}')
    RETURNING id, owner_id, guest_id, rental_id, requested_date;")

    Booking.new(id: result[0]['id'],
    owner_id: result[0]['owner_id'],
    guest_id: result[0]['guest_id'],
    rental_id: result[0]['rental_id'],
    requested_date: result[0]['requested_date']
    )
  end

  def self.user_dates(guest_id:)
    connection = db_selector
    result = connection.exec("SELECT requested_date FROM bookings WHERE guest_id = '#{guest_id}'")
    result.map{ |date| date }
  end

end

# Booking.new(id: result["id"], owner_id: requested_date: result["requested_date"])