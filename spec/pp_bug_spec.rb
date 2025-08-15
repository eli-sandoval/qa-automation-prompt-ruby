require 'spec_helper'
require_relative '../lib/api_client'

# Bug occurs when the string used for the name field includes two lower-case p. Regardless of order or proximity.
# Due to the hard-coded flakiness meant for the uptime task, this bug may sometimes fail with the "system down" message.RSpec.describe 'Bug PP' do
RSpec.describe 'PP Bug' do
  let(:problematic_names) { ['apple', 'puppy', 'happy', 'chipper', 'ripple'] }

  it 'reproducing formatting name issue' do
    problematic_names.each do |name|
      response = ApiClient.post_name(name)

      # Skip iteration if API fails due to the hardcoded downtime bug
      if response.body == '{"message":"System is down"}'
        puts "Skipped due to uptime bug for name: #{name}"
        next
      end

      expect(response.code.to_i).to eq(500)

      puts "Tested '#{name}' => Response code: #{response.code}, Body: #{response.body}"
    end
  end
end