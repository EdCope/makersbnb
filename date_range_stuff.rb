def self.date_range
  if ENV['RACK_ENV'] == 'test'
    connection = PG.connect(dbname: 'makersbnb_test')
  else
    connection = PG.connect(dbname: 'makersbnb')
  end

  result = connection.exec("
  SELECT rental_start_date, TO_CHAR(rental_start_date, 'DD-MM-YYYY') formatted_start_date, 
   rental_end_date, TO_CHAR(rental_end_date, 'DD-MM-YYYY') formatted_end_date FROM rentals;
   ")
  result.map { |rental| Rentals.new( 
    rental_start_date: rental["formatted_start_date"],
    rental_end_date: rental["formatted_end_date"]) }
end