require 'faker'
require_relative 'api_client'
require_relative 'app_config'

class ApiMonitor
  def self.start_monitoring
    faker = Faker::Name
    start_time = Time.now

    loop do
      name = faker.first_name
      begin
        ApiClient.post_name(name)
      rescue StandardError => e
        warn "Failed to send request for #{name}: #{e.message}"
      end

      # Sleep between requests, configurable desde AppConfig
      sleep(AppConfig::MONITOR_INTERVAL_SEC)

      break if Time.now - start_time > AppConfig::MONITOR_DURATION_SEC
    end

    puts "Monitoring finished."
  end
end