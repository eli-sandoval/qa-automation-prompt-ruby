require_relative '../lib/database'
require_relative '../lib/api_monitor'
require_relative '../lib/uptime_calculator'

# Initialize db if it doesn't exist
Database.instance.initialize_schema
puts "[INFO] Database initialized."

# Get values from command line or use defaults
monitor_duration = ARGV[0] ? ARGV[0].to_i : AppConfig::MONITOR_DURATION_SEC
monitor_interval = ARGV[1] ? ARGV[1].to_i : AppConfig::MONITOR_INTERVAL_SEC

# Run monitor
puts "[INFO] Starting API monitor for #{monitor_duration} seconds with a #{monitor_interval} second interval."
ApiMonitor.start_monitoring(duration: monitor_duration, interval: monitor_interval)
