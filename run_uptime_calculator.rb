require_relative 'lib/uptime_calculator'
require_relative 'lib/database'

Database.instance.initialize_schema
puts "[INFO] Database initialized."

puts "[INFO] Starting uptime calculator..."
uptime = UptimeCalculator.calculate
puts "[INFO] Service uptime: #{uptime.round(2)}%"