.PHONY: monitor uptime monitor_and_uptime format_issue_test test clean

# Run the main monitor script (initialize DB, monitor API)
monitor:
	ruby runners/run_monitor.rb $(DURATION) $(INTERVAL)

# Calculate uptime based on DB logs
uptime:
	ruby runners/run_uptime_calculator.rb

# Monitor and calculate uptime based on DB logs
monitor_and_uptime:
	@$(MAKE) monitor DURATION=$(DURATION) INTERVAL=$(INTERVAL)
	ruby runners/run_uptime_calculator.rb

# Run the name formatting issue test (pp string)
format_issue_test:
	ruby runners/run_pp_bug.rb

test:
	rspec

clean:
	rm -f request_logs.db