require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'pg'
require_relative '../app'
require 'pg'


ENV['RACK_ENV'] = 'test'
Capybara.app = MakersBnB


RSpec.configure do |config|
  
  config.expect_with :rspec do |expectations|
    
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before(:each) do
    p "Setting up test database..."
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("TRUNCATE rentals;")
  end
  
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.example_status_persistence_file_path = "spec/examples.txt"

  config.disable_monkey_patching!

  config.warnings = true

  if config.files_to_run.one?
 
    config.default_formatter = "doc"
  end

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed


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

])
SimpleCov.start

end

