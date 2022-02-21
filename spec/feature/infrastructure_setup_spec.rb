feature 'infrastructure setup' do 
  scenario 'lands on home page' do 
    visit('/')
    expect(page).to have_content("MakersBnB")
  end
end
