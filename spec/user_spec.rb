require_relative '../lib/user'

describe User do
  describe '.add' do
    it 'adds a user to database' do
      user = User.add(username: 'Bob', email: 'example@gmail.com', password: 'PASSWORD')
      expect(user.username).to eq 'Bob'
      expect(user.email).to eq 'example@gmail.com'
      expect(user.password).to eq 'PASSWORD'
    end
  end
end
