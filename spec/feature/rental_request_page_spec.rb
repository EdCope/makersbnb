feature 'rental request' do
  scenario 'allow a user to navigate to request page' do
    rental = Rental.add(title:'64 Zoo Lane',rental_description:'Lucys house', price: '3.50', contact_details: 'lucy@zoolane.com', rental_start_date: '2022-02-25', rental_end_date: '2022-03-01' )
    id_of_rental = rental.id
    visit '/'
    page.find("#rental_select_#{id_of_rental}").click
    expect(current_path).to eq "/rental/#{id_of_rental}"
    expect(page).to have_field('Select request date')
  end
end
 