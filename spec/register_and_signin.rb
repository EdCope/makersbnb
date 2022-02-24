def register_and_signin
  User.add(username: 'Trushna', email: 'example@gmail.com', password: 'PASSWORD')
  visit('/')
  fill_in 'username', with: 'Trushna'
  fill_in 'password', with: 'PASSWORD'
  click_button 'Sign in'
end