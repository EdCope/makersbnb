feature 'input rental details' do 
  scenario 'host inputs information about rental into form' do
    visit('/')
    click_button('List a property')
    expect(page).to have_field('title')
    expect(page).to have_field('rental_description')
    expect(page).to have_field('price')
    expect(page).to have_field('contact_details')
  end
end
