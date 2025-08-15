RSpec.configure do |config|

  config.before(:suite) do
    Database.instance.initialize_schema
  end

  # Clear DB before each test. We don't want it here in order to calculate uptime, but it's good practice to clear db before running new tests.
=begin
  config.before(:each) do
    db = Database.instance
    db.execute("DELETE FROM request_logs")
  end
=end
end
