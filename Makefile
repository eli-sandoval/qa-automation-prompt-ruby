.PHONY: monitor calculate_uptime monitor_and_uptime format_issue_test test clean

# Run the main monitor script (initialize DB, monitor API)
monitor:
	ruby run_monitor.rb

# Calculate uptime based on DB logs
calculate_uptime:
	ruby run_uptime_calculator.rb

# Monitor and calculate uptime based on DB logs
monitor_and_uptime:
	ruby run_monitor.rb
	ruby run_uptime_calculator.rb

# Run the name formatting issue test (pp string)
format_issue_test:
	ruby run_pp_bug.rb

test:
	rspec

clean:
	rm -f request_logs.db