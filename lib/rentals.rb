require 'pg'

class Rentals 

  attr_reader :title, :id, :rental_description, :price, :contact_details, :rental_start_date, :rental_end_date

  def initialize(title:, id:, rental_description:, price:, contact_details:, rental_start_date:, rental_end_date:)
    @title = title
    @id = id
    @rental_description = rental_description
    @price = price.to_f
    @contact_details = contact_details
    @rental_start_date = rental_start_date
    @rental_end_date = rental_end_date
  end

  def self.all 
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT * FROM rentals")

    result.map { |rental| Rentals.new(title: rental["title"], 
    id: rental["id"],
    rental_description: rental["rental_description"],
    price: rental["price"],
    contact_details: rental["contact_details"]
    # rental_start_date: rental["rental_start_date"],
    # rental_end_date: rental["rental_end_date"]
    ) }
  end
  
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
    #  p result

    #       result.first['rental_start_date']
    # result.map { |rental|  
    #   rental_start_date: rental["formatted_start_date"],
    #   rental_end_date: rental["formatted_end_date"] }
  end


  def self.add(title:, rental_description:, price:, contact_details:, rental_start_date:, rental_end_date:)
    if ENV['RACK_ENV'] == 'test'
        connection = PG.connect(dbname: 'makersbnb_test')
    else
        connection = PG.connect(dbname: 'makersbnb')
    end
 
    result = connection.exec("INSERT INTO rentals (title, rental_description, price, contact_details, rental_start_date, rental_end_date) 
    VALUES('#{title}', '#{rental_description}', '#{price}', '#{contact_details}', '#{rental_start_date}', '#{rental_end_date}') 
    RETURNING id, title, rental_description, price, contact_details, rental_start_date, rental_end_date")
    Rentals.new(
      id: result[0]['id'], 
      title: result[0]['title'], 
      rental_description: result[0]['rental_description'], 
      price: result[0]['price'], 
      contact_details: result[0]['contact_details'],
      rental_start_date: result[0]['rental_start_date'],
      rental_end_date: result[0]['rental_end_date']
      )
  end
  
end
