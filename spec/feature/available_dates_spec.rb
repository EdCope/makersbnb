feature 'available dates' do
  scenario 'allows host to input available dates in form' do
    register_and_signin
    click_button('My account')
    click_button('List a property')
    expect(current_path).to eq '/add_rental'
    expect(page).to have_field('title')
    expect(page).to have_field('rental_description')
    expect(page).to have_field('price')
    expect(page).to have_field('contact_details')
    expect(page).to have_field('rental_start_date')
    expect(page).to have_field('rental_end_date')
  end
end
