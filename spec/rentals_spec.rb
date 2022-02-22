require 'rentals'

describe Rentals do
  describe '.all' do
    it 'returns all the rentals' do

      connection = PG.connect(dbname: 'makersbnb_test')
      
      connection.exec("INSERT INTO rentals (title) VALUES ('24 Zoo lane');")
      connection.exec("INSERT INTO rentals (title) VALUES('Archies house in Balamory');")

      rentals = Rentals.all

      expect(rentals.length).to eq 2
      expect(rentals.first).to eq '24 Zoo lane'

    end
  end
end
