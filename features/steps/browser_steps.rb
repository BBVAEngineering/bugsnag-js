When("I navigate to the URL {string}") do |path|
  $driver.navigate.to get_test_url path
end

When("I let the test page run for up to {int} seconds") do |n|
  wait = Selenium::WebDriver::Wait.new(timeout: n)
  wait.until {
    $driver.find_element(id: 'bugsnag-test-state') &&
    $driver.find_element(id: 'bugsnag-test-state').text == 'DONE'
  }
end
