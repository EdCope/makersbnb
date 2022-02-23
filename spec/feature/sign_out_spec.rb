feature 'Sign user out' do
  scenario 'allows the user to signout' do
    User.add(username: 'Trushna', email: 'example@gmail.com', password: 'PASSWORD')
    visit('/')
    fill_in 'username', with: 'Trushna'
    fill_in 'password', with: 'PASSWORD'
    click_button 'Sign in'
    click_button 'Sign out'
    expect(page).to have_button 'Sign in'
  end
end
