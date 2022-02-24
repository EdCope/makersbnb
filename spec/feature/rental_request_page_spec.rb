feature 'rental request' do
  scenario 'allow a user to navigate to request page' do
    visit '/'
    click_button 'View rental'
    expect(current_path).to eq '/rental/1'
    expect(page).to have_field('Select request date')
  end
end
 