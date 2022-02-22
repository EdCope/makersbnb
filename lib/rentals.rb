class Rentals 
  def self.all 
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT * FROM rentals")

    result.map { |rental| rental["title"] }
  end
  
end
