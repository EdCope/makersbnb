require_relative '../lib/user'

describe User do
  # let(test_user) { User.add(username: 'Bob', email: 'example@gmail.com', password: 'PASSWORD') }
  describe '.add' do
    it 'adds a user to database' do
      test_user = User.add(username: 'Bob', email: 'example@gmail.com', password: 'PASSWORD')
      expect(test_user.username).to eq 'Bob'
      expect(test_user.email).to eq 'example@gmail.com'
      expect(test_user.password).to eq 'PASSWORD'
    end
  end

  describe '.sign_in' do
    it 'confirms if the user is signed in' do
      User.add(username: 'Julie', email: 's@gmail.com', password: 'Pass')
      test_user = User.sign_in(username: 'Julie', password: 'Pass')
      expect(test_user).to be_a User 
    end
  end
end
