feature 'Sign user out' do
  scenario 'allows the user to signout' do
    User.add(username: 'Trushna', email: 'example@gmail.com', password: 'PASSWORD')
    visit('/')
  end
end
