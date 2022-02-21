require 'rentals'

describe Rentals do
  describe '.all' do
    it 'returns all the rentals' do 
      expect(Rentals.all).to include('24 Zoo lane')
      expect(Rentals.all).to include('Archies house in Balamory')
      expect(Rentals.all).to include('Buckingham Palace')
    end
  end
end
