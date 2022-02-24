require_relative '../spec/database_selector'
class User

  attr_reader :id, :username, :email, :password 
  attr_accessor :logged_in

  def initialize(id:, username:, email:, password:)
    @id = id
    @username = username
    @email = email
    @password = password
    @logged_in = false
    
  end

  def self.add(username:, email:, password:)
    connection = db_selector

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

  def self.sign_in(username:, password:)
    connection = db_selector

    database_user = connection.exec_params("SELECT username, email, password FROM users
    WHERE username = '#{username}'")

    if database_user.first.nil?
      "Username does not exist, please register."
    elsif database_user.first['password'] != password
      "Incorrect password for this user"
    else
      "Login"
      User.new(
        id: database_user[0]['id'],
        username: database_user[0]['username'],
        email: database_user[0]['email'],
        password: database_user[0]['password']
      )
    end

  end
end

