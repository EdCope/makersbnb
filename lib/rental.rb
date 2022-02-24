require 'pg'
require 'database_selector'

class Rental

  attr_reader :title, :id, :rental_description, :price, :contact_details, :rental_start_date, :rental_end_date

  def initialize(title:, id:, rental_description:, price:, contact_details:, rental_start_date:, rental_end_date:)
    @title = title
    @id = id
    @rental_description = rental_description
    @price = price.to_f
    @contact_details = contact_details
    @rental_start_date = rental_start_date.split("-").reverse.join("-")
    @rental_end_date = rental_end_date.split("-").reverse.join("-")
  end

  def self.all 
    connection = db_selector

    result = connection.exec("SELECT * FROM rentals")
    result.map { |rental| Rental.new(title: rental["title"], 
    id: rental["id"],
    rental_description: rental["rental_description"],
    price: rental["price"],
    contact_details: rental["contact_details"],
    rental_start_date: rental["rental_start_date"],
    rental_end_date: rental["rental_end_date"]) 
    }

  end
  
  def self.add(title:, rental_description:, price:, contact_details:, rental_start_date:, rental_end_date:)
    connection = db_selector

 
    result = connection.exec("INSERT INTO rentals (title, rental_description, price, contact_details, rental_start_date, rental_end_date) 
    VALUES('#{title}', '#{rental_description}', '#{price}', '#{contact_details}', '#{rental_start_date}', '#{rental_end_date}') 
    RETURNING id, title, rental_description, price, contact_details, rental_start_date, rental_end_date")
    Rental.new(
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
