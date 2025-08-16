require 'faker'
require_relative 'api_client'
require_relative 'app_config'

class ApiMonitor
  def self.start_monitoring(duration: AppConfig::MONITOR_DURATION_SEC, interval: AppConfig::MONITOR_INTERVAL_SEC)
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
      sleep(interval)

      break if Time.now - start_time > duration
    end

    puts "Monitoring finished."
  end
end