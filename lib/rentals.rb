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
  
end
