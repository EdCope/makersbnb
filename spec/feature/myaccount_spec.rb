feature 'myaccount page for user' do

  scenario 'user can access myaccount from home page' do
    register_and_signin
    click_button 'My account'
    expect(current_path).to eq '/myaccount/:id'
    expect(page).to have_content 'Received booking requests'
    expect(page).to have_content 'Bookings that you have requested'
    expect(page).to have_button 'List a property'
    click_button 'List a property'
    expect(current_path).to eq '/add_rental'
  end

  scenario 'user can see their unique requests for bookings' do
    register_and_signin
    click_button 'List a property'
    fill_in 'title', with: 't1'
    fill_in 'rental_description', with: 'rd1'
    fill_in 'price', with: 99.99
    fill_in 'contact_details', with: 'example@gmail.com'
    fill_in 'rental_start_date', with: '2022-02-01'
    fill_in 'rental_end_date', with: '2022-02-28'
    click_button 'Submit'
    click_button 'My account'
    
    expect(page).to have_content 
  end
end