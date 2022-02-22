feature 'shows rentals' do 
  scenario 'user sees a list of the rentals' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO rentals (title) VALUES ('24 Zoo lane');")
    connection.exec("INSERT INTO rentals (title) VALUES('Archies house in Balamory');")
    connection.exec("INSERT INTO rentals (title) VALUES('Buckingham Palace');")
    
    visit('/')
    expect(page).to have_content('24 Zoo lane')
    expect(page).to have_content('Archies house in Balamory')
    expect(page).to have_content('Buckingham Palace')
  end
end