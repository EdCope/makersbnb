feature 'sign-in' do
  scenario 'Allows the user to sign in' do
    User.add(username: 'Trushna', email: 'example@gmail.com', password: 'PASSWORD')
    visit('/')
    fill_in 'username', with: 'Trushna'
    fill_in 'password', with: 'PASSWORD'
    click_button 'Sign in'
    expect(page).to have_content "Signed in as Trushna"
  end
end
