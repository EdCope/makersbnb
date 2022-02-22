require 'pg'

class Rentals 
  attr_reader :title, :rental_description, :price, :contact_details

def initialize(title, rental_description, price, contact_details)
  @title = title 
  @rental_description = rental_description
  @price = price
  @contact_details = contact_details
end

  def self.all 
    ['64 Zoo lane', 'Archies house in Balamory', 'Buckingham Palace']
  end

  def self.add(title:, rental_description:, price:, contact_details:)
    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'makersbnb_test')
    else
        connection = PG.connect(dbname: 'makersbnb')
    end
 
    connection.exec("INSERT INTO rentals (title, rental_description, price, contact_details) 
    VALUES('#{title}', '#{rental_description}', '#{price}', '#{contact_details}') 
    RETURNING id, title, rental_description, price, contact_details")
  end
end