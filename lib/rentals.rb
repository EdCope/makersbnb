require 'pg'

class Rentals 

  attr_reader :title, :id, :rental_description, :price, :contact_details

  def initialize(title:, id:, rental_description:, price:, contact_details:)
    @title = title
    @id = id
    @rental_description = rental_description
    @price = price.to_f
    @contact_details = contact_details
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
    contact_details: rental["contact_details"]) }
  end
  
  def self.add(title:, rental_description:, price:, contact_details:)
    if ENV['RACK_ENV'] == 'test'
        connection = PG.connect(dbname: 'makersbnb_test')
    else
        connection = PG.connect(dbname: 'makersbnb')
    end
 
    result = connection.exec("INSERT INTO rentals (title, rental_description, price, contact_details) 
    VALUES('#{title}', '#{rental_description}', '#{price}', '#{contact_details}') 
    RETURNING id, title, rental_description, price, contact_details")
    Rentals.new(
      id: result[0]['id'], 
      title: result[0]['title'], 
      rental_description: result[0]['rental_description'], 
      price: result[0]['price'], 
      contact_details: result[0]['contact_details']
      )
  end
  
end
