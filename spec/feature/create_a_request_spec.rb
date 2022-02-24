

feature 'display request' do
  scenario 'request displayed on the account page' do
    rental = Rental.add(title:'64 Zoo Lane',rental_description:'Lucys house', price: '3.50', contact_details: 'lucy@zoolane.com', rental_start_date: '2022-02-25', rental_end_date: '2022-03-01', owner_id: "1" )
    register_and_signin
    id_of_rental = rental.id
    page.find("#rental_select_#{id_of_rental}").click
    click_button 'Submit'
    expect(current_path).to eq '/myaccount'
    expect(page).to have_content '64 Zoo Lane'
  end
end
