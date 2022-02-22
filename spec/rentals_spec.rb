require 'rentals'
require_relative './spec_helper'

RSpec.describe Rentals do
  describe ".all" do
    it 'returns all the rentals' do 
      expect(Rentals.all).to include('64 Zoo lane')
      expect(Rentals.all).to include('Archies house in Balamory')
      expect(Rentals.all).to include('Buckingham Palace')
    end
  end
  describe '.add' do
    it 'adds a new rental to the database' do
      rental = Rentals.add(title:'64 Zoo Lane',rental_description:'Lucys house', price: '3.50', contact_details: 'lucy@zoolane.com' )
      expect(rental['title']).to eq '64 Zoo Lane'
      expect(rental['rental_description']).to eq 'Lucys house'
      expect(rental['price']).to eq '3.50'
      expect(rental['contact_details']).to eq 'lucy@zoolane.com'
    end
  end
end
