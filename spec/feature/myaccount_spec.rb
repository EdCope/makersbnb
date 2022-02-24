# feature 'myaccount page for user' do
#   scenario 'user can access myaccount from home page' do
#     User.add(username: 'Trushna', email: 'example@gmail.com', password: 'PASSWORD')
#     visit('/')
#     fill_in 'username', with: 'Trushna'
#     fill_in 'password', with: 'PASSWORD'
#     click_button 'Sign in'
#     click_button 'My account'
#     expect(current_path).to eq '/myaccount'
#   end
# end