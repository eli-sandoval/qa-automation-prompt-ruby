require_relative 'database'
require_relative 'app_config'

class RequestLogger
  INSERT_SQL = <<-SQL
    INSERT INTO request_logs(url, name_parameter, response_status, response_text)
    VALUES (?, ?, ?, ?)
  SQL

  # Logs a single request to the database
  def self.log(url, name_parameter, status, response)
    db = Database.instance
    db.execute(INSERT_SQL, [url, name_parameter, status, response])

  rescue StandardError => e
    puts "Failed to log request: #{e.message}"
  end
end