require 'integration_spec_helper'
require 'capybara/rails'
require 'capybara/rspec'
require 'database_cleaner'

RSpec.configure do |config|
  DatabaseCleaner.strategy = :truncation
  config.use_transactional_fixtures = false
  config.after :each do
    Capybara.reset_sessions!
    DatabaseCleaner.clean
  end
end
