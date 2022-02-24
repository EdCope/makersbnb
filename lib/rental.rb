require 'pg'
require_relative '../spec/database_selector'

class Rental

  attr_reader :title, :id, :rental_description, :price, :contact_details, :rental_start_date, :rental_end_date, :owner_id

  def initialize(title:, id:, rental_description:, price:, contact_details:, rental_start_date:, rental_end_date:, owner_id:)
    @title = title
    @id = id
    @rental_description = rental_description
    @price = price.to_f
    @contact_details = contact_details
    @rental_start_date = rental_start_date
    @rental_end_date = rental_end_date
    @owner_id = owner_id
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
    rental_end_date: rental["rental_end_date"],
    owner_id: rental["owner_id"]
    ) 
    }

  end
  
  def self.add(title:, rental_description:, price:, contact_details:, rental_start_date:, rental_end_date:, owner_id:)
    connection = db_selector
 
    result = connection.exec("INSERT INTO rentals (title, rental_description, price, contact_details, rental_start_date, rental_end_date, owner_id) 
    VALUES('#{title}', '#{rental_description}', '#{price}', '#{contact_details}', '#{rental_start_date}', '#{rental_end_date}', '#{owner_id}') 
    RETURNING id, title, rental_description, price, contact_details, rental_start_date, rental_end_date, owner_id")
    Rental.new(
      id: result[0]['id'], 
      title: result[0]['title'], 
      rental_description: result[0]['rental_description'], 
      price: result[0]['price'], 
      contact_details: result[0]['contact_details'],
      rental_start_date: result[0]['rental_start_date'],
      rental_end_date: result[0]['rental_end_date'],
      owner_id: result[0]['owner_id']
      )
  end
  
  def self.rental_by_id(id:)
    connection = db_selector

    rental = connection.exec("SELECT * FROM rentals WHERE id = $1;", [id])
    Rental.new(
      id: rental[0]['id'], 
      title: rental[0]['title'], 
      rental_description: rental[0]['rental_description'], 
      price: rental[0]['price'], 
      contact_details: rental[0]['contact_details'],
      rental_start_date: rental[0]['rental_start_date'],
      rental_end_date: rental[0]['rental_end_date'],
      owner_id: rental[0]['owner_id']
      ) 
  end

end
