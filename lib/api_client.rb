require 'net/http'
require 'uri'
require 'json'
require_relative 'request_logger'
require_relative 'app_config'

class ApiClient
  # Sends a POST request with a name to the API and logs the response
  def self.post_name(name)
    uri = URI.parse(AppConfig::API_URL)

    # Build JSON payload
    payload = { name: name }.to_json

    # Create HTTP request
    request = Net::HTTP::Post.new(uri)
    request['Content-Type'] = 'application/json; charset=UTF-8'
    request.body = payload

    # Send request
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end

    # Log request to DB
    RequestLogger.log(uri.to_s, name, response.code.to_i, response.body)

    response
  rescue StandardError => e
    raise "API request failed: #{e.message}"
  end
end
