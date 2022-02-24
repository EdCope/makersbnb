require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'pg'
require_relative '../app'
require_relative './register_and_signin'

ENV['RACK_ENV'] = 'test'
Capybara.app = MakersBnB

RSpec.configure do |config|

  config.before(:each) do
    p "Setting up test database..."
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("TRUNCATE rentals;")
    connection.exec("TRUNCATE users;")
    connection.exec("TRUNCATE bookings;")
  end
  
  config.expect_with :rspec do |expectations|
    
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end

  
  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  
  config.shared_context_metadata_behavior = :apply_to_host_groups

end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
