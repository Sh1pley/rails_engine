RSpec.configure do |config|
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) do
    begin
      DatabaseCleaner.start
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
