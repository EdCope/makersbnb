feature 'Sign up to the website' do
  scenario 'Enter Details for new account' do
    visit('/')
    click_button 'Register'
    expect(current_path).to eq '/add_user'
    fill_in 'username', with: 'Bob'
    fill_in 'email', with: 'example@gmail.com'
    fill_in 'password', with: 'PASSWORD'
    click_button 'Register'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Signed in as Bob'
  end

  xscenario 'Username is taken' do
    visit('/')
  end
end
