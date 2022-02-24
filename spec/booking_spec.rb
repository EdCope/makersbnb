require_relative '../lib/booking'

describe Booking do
  describe "#add" do
    it "adds a booking to the db" do
      test_booking = Booking.add(owner_id: "1",
      guest_id: "2",
      rental_id: "3",
      requested_date: "2022-02-24")
      expect(test_booking.owner_id).to eq "1"
      expect(test_booking.guest_id).to eq "2"
      expect(test_booking.rental_id).to eq "3"
      expect(test_booking.requested_date).to eq "2022-02-24"
    end
  end
end
