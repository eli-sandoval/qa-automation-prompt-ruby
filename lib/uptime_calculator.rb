require_relative 'database'
require_relative 'app_config'

class UptimeCalculator
  # Calculate uptime by counting successful requests and measuring percentage
  def self.calculate
    db = Database.instance
    total_requests = db.execute("SELECT COUNT(*) AS count FROM request_logs")[0]['count']
    successful_requests = db.execute("SELECT COUNT(*) AS count FROM request_logs WHERE response_status = 200")[0]['count']

    return 0 if total_requests.zero?

    (successful_requests.to_f / total_requests.to_f) * 100
  end
end