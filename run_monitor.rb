require_relative 'lib/database'
require_relative 'lib/api_monitor'
require_relative 'lib/uptime_calculator'

# Inicializar DB si no existe
Database.instance.initialize_schema
puts "[INFO] Database initialized."

# Correr el monitor
puts "[INFO] Starting API monitor..."
ApiMonitor.start_monitoring
