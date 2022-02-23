require 'rentals'

describe Rentals do
  describe '.all' do
    it 'returns all the rentals' do

      connection = PG.connect(dbname: 'makersbnb_test')
      
      rental = connection.exec("INSERT INTO rentals (title, rental_description, price, contact_details) 
      VALUES ('64 Zoo lane', 'rdt1', 99.99, 'cdt1');")
      connection.exec("INSERT INTO rentals (title) VALUES('Archies house in Balamory');")

      rentals = Rentals.all

      expect(rentals.length).to eq 2
      # expect(rentals.first).to eq rental.id
      expect(rentals.first).to be_a Rentals
      expect(rentals.first.title).to eq '64 Zoo lane'
      expect(rentals.first.rental_description).to eq 'rdt1'
      expect(rentals.first.price).to eq 99.99
      expect(rentals.first.contact_details).to eq 'cdt1'
    end
  end
  
  describe '.add' do
    it 'adds a new rental to the database' do
      rental = Rentals.add(title:'64 Zoo Lane',rental_description:'Lucys house', price: '3.50', contact_details: 'lucy@zoolane.com' )
      expect(rental.title).to eq '64 Zoo Lane'
      expect(rental.rental_description).to eq 'Lucys house'
      expect(rental.price).to eq 3.50
      expect(rental.contact_details).to eq 'lucy@zoolane.com'
      expect(rental.rental_start_date).to eq '2022-02-25'
      expect(rental.rental_end_date).to eq '2022-03-01'
    end
  end

  
end
