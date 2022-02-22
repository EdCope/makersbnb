class User

  attr_reader :id, :username, :email, :password
  def initialize(id:, username:, email:, password:)
    @id = id
    @username = username
    @email = email
    @password = password
    
  end

  def self.add(username:, email:, password:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec_params("INSERT INTO users (username, email, password) 
     VALUES('#{username}', '#{email}', '#{password}')
     RETURNING id, username, email, password")
     User.new(
       id: result[0]['id'],
       username: result[0]['username'],
       email: result[0]['email'],
       password: result[0]['password']
     )
  end
  
end
