feature 'shows rentals' do 
  scenario 'user sees a list of the rentals' do
    visit('/')
    expect(page).to have_content('24 Zoo lane')
    expect(page).to have_content('Archies house in Balamory')
    expect(page).to have_content('Buckingham Palace')
  end
end