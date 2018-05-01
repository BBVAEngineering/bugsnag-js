# Any 'run once' setup should go here as this file is evaluated
# when the environment loads.
# Any helper functions added here will be available in step
# definitions

require_relative '../lib/install-dependencies'

def _port
  '9020'
end

# start the web server
pid = Process.spawn("features/fixtures/node_modules/.bin/serve --port=#{_port} features/fixtures",
  :out => '/dev/null',
  :err => '/dev/null',
)
Process.detach pid

require_relative '../lib/browserstack_driver'

unless ENV['TRAVIS'] then
  bs_local = bs_local_start
end

$driver = driver_start

# Scenario hooks
Before do
  # Runs before every Scenario
end

Before '@handled' do
  $handled_fixtures_built ||= false
  if !$handled_fixtures_built then
    $handled_fixtures_built = true
    run_required_commands([
      [ 'features/fixtures/handled/webpack/build.sh' ],
      [ 'features/fixtures/handled/browserify/build.sh' ],
    ])
  end
end

def get_test_url path
  "http://localhost:#{_port}#{path}?PORT=#{@script_env['MOCK_API_PORT']}"
end

require 'yaml'
$errors = YAML::load open 'features/fixtures/browser-errors.yml'
def get_error_message id
  msg = $errors[ENV['BROWSER']]
  msg[id]
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
