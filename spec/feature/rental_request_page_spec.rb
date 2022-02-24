feature 'individual rental page' do
  scenario 'allow a user to navigate to rental property page' do
    rental = Rental.add(title:'64 Zoo Lane',rental_description:'Lucys house', price: '3.50', contact_details: 'lucy@zoolane.com', rental_start_date: '2022-02-25', rental_end_date: '2022-03-01', owner_id: "1" )
    id_of_rental = rental.id
    visit '/'
    page.find("#rental_select_#{id_of_rental}").click
    expect(current_path).to eq "/rental/#{id_of_rental}"
  end

  scenario 'provide a request form for one date at rental' do
    rental = Rental.add(title:'64 Zoo Lane',rental_description:'Lucys house', price: '3.50', contact_details: 'lucy@zoolane.com', rental_start_date: '2022-02-25', rental_end_date: '2022-03-01', owner_id: "1" )
    id_of_rental = rental.id
    visit '/'
    page.find("#rental_select_#{id_of_rental}").click
    expect(page).to have_field('requested_date')
  end
end
 
