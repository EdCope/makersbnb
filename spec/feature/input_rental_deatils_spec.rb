feature 'input rental details' do 
  scenario 'host inputs information about rental into form' do
    visit('/add_rental')
    # click_button('list a rental')
    expect(page).to have_field('title')
    expect(page).to have_field('rental_description')
    expect(page).to have_field('price')
    expect(page).to have_field('contact_details')
  end
end