require 'rentals'

describe Rentals do
  describe '.all' do
    it 'returns all the rentals' do

      connection = PG.connect(dbname: 'makersbnb_test')
      
      rental = connection.exec("INSERT INTO rentals (title, rental_description, price, contact_details) 
      VALUES ('24 Zoo lane', 'rdt1', 99.99, 'cdt1');")
      connection.exec("INSERT INTO rentals (title) VALUES('Archies house in Balamory');")

      rentals = Rentals.all

      expect(rentals.length).to eq 2
      # expect(rentals.first).to eq rental.id
      expect(rentals.first).to be_a Rentals
      expect(rentals.first.title).to eq '24 Zoo lane'
      expect(rentals.first.rental_description).to eq 'rdt1'
      expect(rentals.first.price).to eq 99.99
      expect(rentals.first.contact_details).to eq 'cdt1'
    end
  end
end
