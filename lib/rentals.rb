class Rentals 
  attr_reader :title

  def initialize(title:)
    @title = title
  end


  def self.all 
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT * FROM rentals")

    result.map { |rental| Rentals.new(title: rental["title"]) }
  end
  
end
