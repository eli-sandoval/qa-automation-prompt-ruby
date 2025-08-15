require 'sqlite3'
require 'singleton'
require_relative 'app_config'

class Database
  include Singleton # Ensures only one instance exists; avoids multiple DB connections

  attr_reader :connection

  def initialize
    # DB path from AppConfig; decouples file path from logic for easy config changes
    db_file = AppConfig::DB_FILE
    # Establish connection
    @connection = SQLite3::Database.new(db_file)
    @connection.results_as_hash = true
  end

  # Executes schema file to create tables if they do not exist
  def initialize_schema
    schema_path = AppConfig::SCHEMA_PATH
    schema_sql = File.read(schema_path)
    @connection.execute_batch(schema_sql)
  rescue StandardError => e
    raise "DB initialization failed: #{e.message}"
  end

  # Execute an arbitrary query with optional parameters
  def execute(query, params = [])
    @connection.execute(query, params)
  end
end