require 'rental'

describe Rental do
  describe '.all' do
    it 'returns all the rentals' do

      
      rental = Rental.add(title:'64 Zoo Lane',rental_description:'Lucys house', price: '3.50', contact_details: 'lucy@zoolane.com', rental_start_date: '2022-02-25', rental_end_date: '2022-03-01', owner_id: "1" )
      Rental.add(title:'24 Zoo Lane',rental_description:'Lucys house', price: '3.50', contact_details: 'lucy@zoolane.com', rental_start_date: '2022-02-25', rental_end_date: '2022-03-01', owner_id: "1" )


      rentals = Rental.all

      expect(rentals.length).to eq 2
      expect(rentals.first).to be_a Rental
      expect(rentals.first.id).to eq rental.id
      
      expect(rentals.first.title).to eq '64 Zoo Lane'
      expect(rentals.first.rental_description).to eq 'Lucys house'
      expect(rentals.first.price).to eq 3.50
      expect(rentals.first.contact_details).to eq 'lucy@zoolane.com'
      expect(rentals.first.rental_start_date).to eq '2022-02-25'
      expect(rentals.first.rental_end_date).to eq '2022-03-01'
    end
  end
  
  describe '.add' do
    it 'adds a new rental to the database' do
      rental = Rental.add(title:'64 Zoo Lane',rental_description:'Lucys house', price: '3.50', contact_details: 'lucy@zoolane.com', rental_start_date: '2022-02-25', rental_end_date: '2022-03-01', owner_id: "1" )

      expect(rental.title).to eq '64 Zoo Lane'
      expect(rental.rental_description).to eq 'Lucys house'
      expect(rental.price).to eq 3.50
      expect(rental.contact_details).to eq 'lucy@zoolane.com'
      expect(rental.rental_start_date).to eq '2022-02-25'
      expect(rental.rental_end_date).to eq '2022-03-01'
    end
  end

  describe '.rental_by_id' do
    it 'selects a specific rental from database by id' do
      rental = Rental.add(title:'64 Zoo Lane',rental_description:'Lucys house', price: '3.50', contact_details: 'lucy@zoolane.com', rental_start_date: '2022-02-25', rental_end_date: '2022-03-01', owner_id: "1")
      test_rental = Rental.rental_by_id(id: rental.id)
      expect(test_rental.title).to eq '64 Zoo Lane'
      # implied all entry information is available
    end
  end
end
