# Any 'run once' setup should go here as this file is evaluated
# when the environment loads.
# Any helper functions added here will be available in step
# definitions

require_relative './install-dependencies'

# start the web server
pid = Process.spawn('features/fixtures/node_modules/.bin/serve --port=9020 features/fixtures',
  :out => '/dev/null',
  :err => '/dev/null',
)
Process.detach pid

require_relative './browserstack_driver'

unless ENV['TRAVIS'] then
  bs_local = bs_local_start
end

$driver = driver_start

# Scenario hooks
Before do
  # Runs before every Scenario
end

After do
  # Runs after every Scenario
  $driver.navigate.to 'about:blank'
end

at_exit do
  # Runs when the test run is completed
  $driver.quit
  unless ENV['TRAVIS'] then
    bs_local.stop
  end
  begin
    Process.kill('HUP', pid)
  rescue
  end
end
